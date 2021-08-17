package com.petpet.order;

import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petpet.bean.OrderBean;
import com.petpet.upload.ProductService;

import lombok.experimental.PackagePrivate;

@Controller
public class OrderController {

	
	@Autowired
	private OrderService orderService; //不用new物件很棒
	
	@RequestMapping(path="/addorder", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<?> uploadproduct (Model model, HttpServletRequest request){
		
		orderService.addNewOrder();
		
		return new ResponseEntity<>("新增訂單", HttpStatus.OK);
	}
	
	
	@RequestMapping(path={"/ecpay"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String fakeEcpay(Model m,String sortField, String sortDir) {
		
		return "order/ecpay";
	}
	
	@PostMapping ("/ecpaytest")
	public @ResponseBody ResponseEntity<?>  ecpaypostreceive(@RequestParam(name = "CheckMacValue") String checkMacValue,
			@RequestParam(name = "PaymentDate") String paymentDate,		
			@RequestParam(name = "PaymentType") String paymentType,
			@RequestParam(name = "RtnMsg") String rtnMsg,
			@RequestParam(name = "RtnCode") String rtnCode,
			@RequestParam(name = "TradeAmt") String tradeAmt,
			@RequestParam(name = "TradeDate") String tradeDate,
			@RequestParam(name = "TradeNo") String tradeNo,
			Model m ) {
		if (rtnCode.equals("1")) {
			System.out.println("交易成功");
		}
		System.out.println(checkMacValue);
		
		return new ResponseEntity<>("新增訂單", HttpStatus.OK);
	}
	
	
	
	
	@RequestMapping(path={"/listorder"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String memberviewHomepage(Model m,String sortField, String sortDir) {
		return orderListEvents(m,1, "id", "asc");
	}//預設排序跟順序
	@RequestMapping(path={"/order.queryallevent.controller/page/{pageNum}"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String orderListEvents(Model m,@PathVariable(name = "pageNum") int pageNum,
			 @Param("sortField") String sortField,
		     @Param("sortDir") String sortDir )  {
		
			Page<OrderBean> page = orderService.orderQueryAllPage(pageNum, sortField, sortDir);
			List<OrderBean> listOrders = page.getContent();			
		    m.addAttribute("currentPage", pageNum);
		    m.addAttribute("totalPages", page.getTotalPages());
		    m.addAttribute("totalItems", page.getTotalElements());	
		    m.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		    m.addAttribute("sortField", sortField);
		    m.addAttribute("sortDir", sortDir);
			m.addAttribute("orders", listOrders);

		return 	"order/listorder";
	}
	
	@RequestMapping(path={"/orders/detail/{id}"} , method = {RequestMethod.POST,RequestMethod.GET})
	public String orderDetails(@PathVariable("id") Integer id , Model model,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
	try {
		OrderBean order = orderService.get(id);
		model.addAttribute("order",order);
		
		return "/order/orderdetail";
		
	}catch (NoSuchElementException ex) {
		redirectAttributes.addFlashAttribute("error",ex.getMessage());		
		return "/listorder";
	}
	
	
	
}
}