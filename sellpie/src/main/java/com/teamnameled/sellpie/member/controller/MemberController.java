package com.teamnameled.sellpie.member.controller;


import java.io.File;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.stream.StreamResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.teamnameled.sellpie.contract.controller.ContractController;
import com.teamnameled.sellpie.contract.model.service.ContractService;
import com.teamnameled.sellpie.contract.model.vo.Contract;
import com.teamnameled.sellpie.admin.model.service.AdminService;
import com.teamnameled.sellpie.common.GenerateCertNumber;
import com.teamnameled.sellpie.contract.model.vo.ContractWithName;
import com.teamnameled.sellpie.contract.model.vo.SalesListVo;
import com.teamnameled.sellpie.member.model.service.MemberService;
import com.teamnameled.sellpie.member.model.vo.Member;
import com.teamnameled.sellpie.seller.model.service.SellerService;
import com.teamnameled.sellpie.seller.model.vo.SalesStatisticsVo;
import com.teamnameled.sellpie.seller.model.vo.Seller;

@Controller
public class MemberController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	ContractService contractService;
	
	@Autowired
	SellerService sellerService;

	@RequestMapping("login.do")
	public String loginPage(){
		// ????????? ???????????? ??????
		return "member/login";
	}
	@RequestMapping("memberJoin.do")
	public String memberJoin(){
		//???????????? 1 ?????????(???????????????)??? ??????
		
		return "member/join/email";
	}
	@RequestMapping("getName.do")
	public String getName(){
		return "member/join/name";
	}
	@RequestMapping("getGender.do")
	public String getGender(){
		return "member/join/gender";
	}
	@RequestMapping("getPhone.do")
	public String getPhone(){
		return "member/join/phone";
	}
	@RequestMapping("getBirth.do")
	public String getBirth(HttpSession session){
		return "member/join/birth";
	}
	@RequestMapping("checkEmail.do")
	public @ResponseBody HashMap<String, String> checkEmail(String email){
		//????????? ???????????? ???????????? ????????????
		Member member =  memberService.checkEmail(email);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("msg", "?????? ????????? ????????????????");
		map.put("result", "1");
		if(null==member){
			GenerateCertNumber gcn = new GenerateCertNumber();
			
			int randomNum = gcn.excuteGenerate();
			String setfrom = "whattoday2018@gmail.com";         
		    String tomail  = email;    // ?????? ?????? ?????????
		    String title   = "#Sellpie ?????? ???????????????.";      // ??????
		    String content = "??????????????? ["+randomNum+"] ?????????.";    // ??????
		    String parseNum = String.valueOf(randomNum);
		    try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // ??????????????? ??????????????? ?????? ??????????????? ??????
		      messageHelper.setTo(tomail);     // ???????????? ?????????
		      messageHelper.setSubject(title); // ??????????????? ????????? ????????????
		      messageHelper.setText(content);  // ?????? ??????
		     
		      mailSender.send(message);
		      map.put("msg", "????????? ?????? ?????? ???????????????.");
		      map.put("result", "2");
		      map.put("randomNum", parseNum);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		}
		
		return map;
	}
	@RequestMapping("changePwdAu.do")
	public @ResponseBody HashMap<String, String> changePwd(String email){
		//???????????? ???????????? ??????..
		System.out.println(email);
		Member member =  memberService.checkEmail(email);
		System.out.println(member);
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		if(null!=member){
			GenerateCertNumber gcn = new GenerateCertNumber();
			
			int randomNum = gcn.excuteGenerate();
			String setfrom = "whattoday2018@gmail.com";         
		    String tomail  = email;    // ?????? ?????? ?????????
		    String title   = "#Sellpie ?????? ???????????????.";      // ??????
		    String content = "??????????????? ["+randomNum+"] ?????????.";    // ??????
		    String parseNum = String.valueOf(randomNum);
		    try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // ??????????????? ??????????????? ?????? ??????????????? ??????
		      messageHelper.setTo(tomail);     // ???????????? ?????????
		      messageHelper.setSubject(title); // ??????????????? ????????? ????????????
		      messageHelper.setText(content);  // ?????? ??????
		     
		      mailSender.send(message);
		      map.put("msg", "????????? ?????? ?????? ???????????????.");
		      map.put("result", "1");
		      map.put("randomNum", parseNum);
		      map.put("email", email);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		}else{
			map.put("result", "2");
			
		}
		return map;
	}
	

	@RequestMapping(value = "signUp.do", method = RequestMethod.POST)
	public ModelAndView memberJoin(Member member, HttpSession session, ModelAndView mav, HttpServletRequest request){
		
		int result = 0;
		try {
			result =  memberService.insertMember(member);
			if(result>0){
				session.setAttribute("user", member);
				int result2 = adminService.insertCount(member.getEmail());
				mav.setViewName("redirect:selectBoardList.do");
			}else{
				mav.addObject("msg", "?????? ?????? ????????? ?????? ??????!");
				mav.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mav.addObject("msg", "?????? ?????? ????????? ?????? ??????!");
			mav.setViewName("common/errorPage");
			e.printStackTrace();
		}
		return mav;
	}
	//????????? ????????????
	@RequestMapping("deleteCookie.do")
	public String test(HttpServletRequest request, HttpServletResponse response){
		Cookie[] cookies = request.getCookies();
	     
	    if(cookies != null){
	        for(int i=0; i < cookies.length; i++){
	             
	            // ????????? ??????????????? 0?????? ???????????? ???????????????
	            cookies[i].setMaxAge(0) ;
	             
	            // ?????? ????????? ????????????
	            response.addCookie(cookies[i]) ;
	        }
	}
	    return "redirect:signIn.do";
	}
	//signIn ?????????
	@RequestMapping("signIn.do")
	public String signIn(){
		return "signIn/signIn";
	}
	@RequestMapping("changePwd.do")
	public String changePwd(){
		return "member/changePwd";
	}
	//???????????????
	@RequestMapping(value="userLogin.do", method= RequestMethod.POST)
	public @ResponseBody HashMap<String, String> loginUser(String email, String pwd, boolean isUseCookie, HttpSession session, HttpServletResponse response){
		
		if(session.getAttribute("user")!=null){
			session.removeAttribute("user");
		}
		Member member = new Member();
		member.setEmail(email);
		member.setPwd(pwd);
		Member user = memberService.userLogin(member);
		HashMap<String, String> map = new HashMap<String, String>();
		if(null!=user){
			session.setAttribute("user", user);
			int result = adminService.insertCount(email);
			map.put("user", user.getName());
			map.put("result", "1");
			if(isUseCookie){
				Cookie cookie = new Cookie("loginCookie", session.getId());//??????????????????
				cookie.setPath("/");
				int period = 60*60*24*3;
				cookie.setMaxAge(period);
				response.addCookie(cookie);
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*period));
				memberService.keepLogin(user.getEmail(), session.getId(), sessionLimit);
			}
		}else{
			map.put("result", "2");
		}
		return map;
	}
	//????????????
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		if(null!=session.getAttribute("user")){
			Member member = (Member)session.getAttribute("user");
			session.invalidate();			
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie!=null){
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
			Date date = new Date(System.currentTimeMillis());
			memberService.keepLogin(member.getEmail(), session.getId(), date);
			}
		}
		return "redirect:signIn.do";
	}
	@RequestMapping("changeUserPwd.do")
	public String changeUserPwd(){
		return "member/changeUserPwd";
	}
	@RequestMapping(value="updateUserPwd.do", method=RequestMethod.POST)
	public String updateUserPwd(Member member){
		System.out.println(member);
		try {
			int result = memberService.updateUserPwd(member);
			System.out.println(result);
		} catch (Exception e) {
			System.out.println("???????????? ????????? ?????????");
			e.printStackTrace();
		}
		
		return "redirect:signIn.do";
	}
	@RequestMapping(value="memberSearch.do")
	public String searchMember(String searchText,HttpServletRequest request) {
		List<Member> memberList = memberService.searchMemberList(searchText);
		request.setAttribute("memberList", memberList);
		request.setAttribute("searchText", searchText);
		return "member/searchMemberList";
	}
	@RequestMapping("updateUserInfo.do")
	public String updateUserInfo(){
		return "member/updateUserInfo";
	}
		@RequestMapping("updateMember.do")
		public String updateMember(){
			return "member/memberUpdate";
		}
		@RequestMapping("userImgUpload.do")
		public @ResponseBody String userImgUpload(MultipartHttpServletRequest request, HttpServletRequest servletRequest, Member member, HttpSession session){
			// ?????? ?????? ??????
	        String root = servletRequest.getSession().getServletContext().getRealPath("resources");
	        System.out.println(root);
	        String path = root+"\\images\\userImg";
	        String newFileName = ""; // ????????? ?????? ?????????
	         
	        File dir = new File(path);
	        if(!dir.isDirectory()){
	            dir.mkdirs();
	        }
	         
	        	Iterator<String> file = request.getFileNames();
	            String uploadFile = file.next();
	                         
	            MultipartFile mFile = request.getFile(uploadFile);
	            String fileName = mFile.getOriginalFilename();
	            System.out.println("?????? ?????? ?????? : " +fileName);
	            
	            
	            
	            newFileName = System.currentTimeMillis()+"."
	                    +fileName.substring(fileName.lastIndexOf(".")+1);
	            try {
	                mFile.transferTo(new File(path+"\\"+newFileName));
	                Member userData = memberService.checkEmail(member.getEmail());
	                userData.setProfileImg(newFileName);
	                int result = memberService.updateImg(userData);
	                if(0<result){
	                	session.setAttribute("user", userData);
	                }else{
	                	System.out.println("?????? ????????? ??????");
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	         
	        System.out.println("id : " + request.getParameter("id"));
	        System.out.println("pw : " + request.getParameter("pw"));
	        
			return "msg";
		}
	@RequestMapping(value = "modifyUserInfo.do", method=RequestMethod.POST)
	public ModelAndView modifyUserInfo(Member member, ModelAndView mav){
		System.out.println(member);
			try {
				int result = memberService.modifyUserInfo(member);
				if(0<result){
					mav.setViewName("redirect:selectBoardList.do");
				}
				
			} catch (Exception e) {
				mav.addObject("msg", "?????? ?????? ????????? ?????? ??????!");
				mav.setViewName("common/errorPage");
				e.printStackTrace();
			}
			
		
		return mav;
	}
	
	@RequestMapping("errorPage.do")
	public String errorPage(){
		return "common/errorPage";
	}
	
	//??????????????????-????????????
	@RequestMapping("purchaseList.do")
	public String purchaseList(String email, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("user");
		List<Contract> purchaseList = contractService.selectContractList(user.getEmail());
		List<ContractWithName> purchaseListWithName = null;
		if(!purchaseList.isEmpty()){
			purchaseListWithName = contractService.selectContractListWithName(purchaseList);
		}
		request.setAttribute("cList", purchaseList);
		request.setAttribute("pList", purchaseListWithName);
		return "member/purchaseList";
	}
	//??????????????????-????????????
	@RequestMapping("salesList.do")
	public String salesList(HttpServletRequest request, SalesListVo salesListVo) {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("user");
		salesListVo.setEmail(user.getEmail());
		List<SalesListVo> pList = contractService.selectSalesList(salesListVo);
		List<SalesStatisticsVo> sList = sellerService.selectSalesStatisticsList(user.getEmail());
		request.setAttribute("pList", pList);
		request.setAttribute("sList", sList);
		return "member/salesList";
	}
	/*@RequestMapping("applySeller.do")
	public String applySeller(Seller seller, HttpServletRequest request) {
		//xml??????
		StreamResult result = memberService.applySeller(seller);
		System.out.println(result.toString());
		return null;
	}*/
	@RequestMapping("inputUrlToSession.do")
	public @ResponseBody int inputUrlToSession(HttpServletRequest request, String url) {
		int result = 1;
		System.out.println(url);
		HttpSession session = request.getSession();
		session.setAttribute("url", url);
		return result;
	}
}
