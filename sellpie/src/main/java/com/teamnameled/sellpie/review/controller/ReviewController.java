package com.teamnameled.sellpie.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamnameled.sellpie.product.model.vo.Product;
import com.teamnameled.sellpie.review.model.service.ReviewService;
import com.teamnameled.sellpie.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;

	public List<Review> selectReviewList(List<Product> productList) {
		/*List<Integer> pNoList = null;
		for(int i = 0; i<productList.size();i++) {
			//productList 각 객체의 pNo 값을 list에 저장
			pNoList.add(productList.get(i).getpNo());
			System.out.println(pNoList.get(i));
		}*/
		List<Review> reviewList = reviewService.selectReviewList(productList);
		return reviewList;
	}
	
	@RequestMapping("insertReview.do")
	public @ResponseBody int updateReview(Review review) {
		int result = 0;
		result = reviewService.insertReview(review);
		return result;
	}
	
	@RequestMapping("checkReview.do")
	public @ResponseBody int checkReview(int checkCno) {
		int result = 0;
		System.out.println(checkCno);
		Review review = reviewService.checkReview(checkCno);
		if(review != null){
			result = review.getReviewStar();
		}
		return result;
	}
}
