package com.teamnameled.sellpie.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamnameled.sellpie.member.model.vo.Member;
import com.teamnameled.sellpie.product.model.service.ProductService;
import com.teamnameled.sellpie.product.model.vo.Product;
import com.teamnameled.sellpie.resource.model.service.ResourceService;
import com.teamnameled.sellpie.resource.model.vo.ResourceVo;
import com.teamnameled.sellpie.review.controller.ReviewController;
import com.teamnameled.sellpie.review.model.vo.Review;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ResourceService resourceService;
	@Autowired
	ReviewController reviewController;
	
	@RequestMapping("productList.do")
	public String selectProductList(int sNo,HttpServletRequest request) {
		List<Product> productList = productService.selectProductList(sNo);
		System.out.println(productList.toString());
		List<Review> reviewList = reviewController.selectReviewList(productList);
		double[] starAvg = new double[productList.size()];
		int[] flooredStarAvg = new int[productList.size()];
		int[] reviewerCount = new int[productList.size()];
		for(int i=0;i<productList.size();i++) {
			for(int j = 0; j<reviewList.size(); j++) {
				if(productList.get(i).getpNo() == reviewList.get(j).getpNo()) {
					starAvg[i] += reviewList.get(j).getReviewStar();
					reviewerCount[i] += 1;
				}
			}
		}
		
		for(int i=0; i<starAvg.length;i++) {
			starAvg[i] /= reviewerCount[i];
			flooredStarAvg[i] = (int)Math.round(starAvg[i]);
		}
		request.setAttribute("productList", productList);
		request.setAttribute("starList", flooredStarAvg);
		request.setAttribute("countList", reviewerCount);
		return "product/productList";
	}
	
	@RequestMapping("productForm.do")
	public String productForm() {
		
		return "product/productForm";
	}
	
	@RequestMapping(value = "productApply.do", method=RequestMethod.POST)
	public String productApply(MultipartHttpServletRequest multipartHttpServletRequest,
			Product product, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    String email = ((Member)session.getAttribute("user")).getEmail();
		int productResult = -1;
		int resourceResult = 0;
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssZ");
		String bcontent = product.getpDetail();
		if(product.getIsCraft() != 'Y'){
			product.setIsCraft('N');
		}
		
		// ????????? ???????????? ?????? ?????????
		String root = request.getSession().getServletContext().getRealPath("resources");
		//????????????
		String filePath = root+"\\product\\"+email+"\\"+sdf.format(today).toString();
		String savePath = "resources/product/"+email+"/"+sdf.format(today).toString();
		//???????????? List???????????? ??????
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("file");
		
		File file = new File(filePath);
		//????????? ????????? ??????????????? ??????
		if (!file.exists()) {
		    file.mkdirs();
		}
		
		//insert form ????????? ??? ?????? ?????????,????????? ????????? ???????????? ?????? ????????????.
		
		String errorMsg = "";
		
		if(email==null||email.length()==0||email.equals("")){
			errorMsg = "???????????? ????????? ???????????????.";
		}else if(bcontent==null||bcontent.length()==0||bcontent.trim().equals("")){
			errorMsg = "????????? ??????????????????.";
		}else{
			int fileLength = 0;
			for (int i = 0; i < files.size(); i++) {
					
				UUID uuid = UUID.randomUUID();
	
				if(null!=files.get(i).getOriginalFilename()&&!files.get(i).getOriginalFilename().equals("")){
					product.setrUrl(savePath);
					file = new File(filePath+"\\"+uuid+files.get(i).getOriginalFilename());
					ResourceVo resource = new ResourceVo();
					resource.setRsrc(savePath+"/"+uuid+files.get(i).getOriginalFilename());
					resourceResult += resourceService.insertResource(resource);
					if(fileLength<resourceResult){
						fileLength++;
					}
					try {
						files.get(i).transferTo(file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					} 
				}
			}
			
			
			if(resourceResult==fileLength){
				
				productResult = productService.insertProduct(product);
				System.out.println(product+"/"+email);
				if(0<productResult){
				}else{
					errorMsg="insertProduct?????? ?????? ??????!!";//??????????????? ????????? ??????
				}
			}else{
				errorMsg="db??? file insert??? ??????";
			}
		}
	
		request.setAttribute("msg", errorMsg);
		
		System.out.println(product.toString());
		String returnUrl = (String) request.getSession().getAttribute("url");
	      if(null == returnUrl){
	    	  returnUrl = "salesList.do";
	      }
		
		return "redirect:"+returnUrl;
	}
	
	
	@RequestMapping("productUpdateForm.do")
	public ModelAndView productUpdateForm(int pNo, ModelAndView mv){
		Product product = productService.selectProduct(pNo);
		mv.addObject("product", product);
		mv.setViewName("product/productUpdateForm");
		return mv;
	}
	
	@RequestMapping("productUpdate.do")
	   public String updateBoard(MultipartHttpServletRequest multipartHttpServletRequest, Product product, String delfile, HttpServletRequest request){
		  HttpSession session = request.getSession();
	      String email = ((Member)session.getAttribute("user")).getEmail();
	      if(product.getIsCraft() != 'Y'){
				product.setIsCraft('N');
		}
	      Date today = new Date();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssZ");
	      // ????????? ???????????? ?????? ?????????
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      //????????????
	      String filePath = root+"\\product\\"+email+"\\"+sdf.format(today).toString();
	      String savePath = "resources/product/"+email+"/"+sdf.format(today).toString();
	      //???????????? List???????????? ??????
	      List<MultipartFile> files = multipartHttpServletRequest.getFiles("file");
	      
	      Product tempProduct = productService.selectProduct(product.getpNo());
	      System.out.println(tempProduct.getrUrl());
	      //update?????? ?????? ?????? ??????
	      String folder = tempProduct.getrUrl();
	      if(null!=folder){
	         String delfilePath = root.replace("resources", folder.replace("/", "\\"));
	         System.out.println(delfilePath);
	         //?????? ?????? ???????????? ?????? ????????? ????????? ??????
	         File temp = new File(delfilePath);
	         File[] a = temp.listFiles();
	         if(null != a && a.length != 0){
	        	 for(int x=0; x<a.length; x++){
	        		 int result = resourceService.deleteResource(folder+"/"+a[x].getName());
	        		 if(0<result){
	        			 int rResult = -1;
	        			 if(delfile.contains(a[x].getName())){
	        				 a[x].delete();
	        			 }else{
	        				 ResourceVo resource = new ResourceVo();
	        				 resource.setRsrc(savePath+"/"+a[x].getName());
	        				 rResult = resourceService.insertResource(resource);
	        				 
	        				 if(rResult<=0){
	        					 System.out.println("update?????? resource insert??? ??????!");
	        				 }
	        			 }      
	        			 
	        		 }
	        	 }
	         }

	         File renamefile = new File(filePath);
	         temp.renameTo(renamefile);      
	      }
	      
	            
	      File file = new File(filePath);
	      //????????? ????????? ??????????????? ??????
	      if (!file.exists()) {
	          file.mkdirs();
	      }
	      

	      int fileLength = 0;
	      int resourceResult = 0;
	      for (int i = 0; i < files.size(); i++) {   
	         UUID uuid = UUID.randomUUID();
	         if(null!=files.get(i).getOriginalFilename()&&!files.get(i).getOriginalFilename().equals("")){
	            file = new File(filePath+"\\"+uuid+files.get(i).getOriginalFilename());
	            ResourceVo resource = new ResourceVo();
	            resource.setRsrc(savePath+"/"+uuid+files.get(i).getOriginalFilename());
	            resourceResult += resourceService.insertResource(resource);
	               if(fileLength<resourceResult){
	                  fileLength++;
	               }
	               try {
	                  files.get(i).transferTo(file);
	               } catch (IllegalStateException e) {
	                  // TODO Auto-generated catch block
	                  e.printStackTrace();
	               } catch (IOException e) {
	                  // TODO Auto-generated catch block
	                  e.printStackTrace();
	               } 
	            }
	      }
	      
	      File updateFile = new File(filePath);
	      File[] b = updateFile.listFiles();
	      if(null!=b && b.length!=0){
	         product.setrUrl(savePath);
	      }else{
	         file.delete();
	      }
	      
	      
	      
	      int updateBResult = productService.updateProduct(product);
	      if(0<updateBResult){
	         
	      }else{
	         System.out.println("board update??? ??????!!");
	      }
	   
	      String returnUrl = (String) request.getSession().getAttribute("url");
	      if(null == returnUrl){
	    	  returnUrl = "salesList.do";
	      }
	      
	      return "redirect:"+returnUrl;
	   }
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(int pNo, HttpServletRequest request) {
		int result = productService.deleteProduct(pNo);
		
		String returnUrl = (String) request.getSession().getAttribute("url");
	      if(null == returnUrl){
	    	  returnUrl = "salesList.do";
	      }
	      
	      return "redirect:"+returnUrl;
	}
}
