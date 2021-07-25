package com.petpet.upload;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petpet.bean.ProductBean;

@Controller
public class UploadPicController {
	
	@Value("${uploadDir}")  // 從application,properties 裡獲得路徑，就是/resources之下
	private String uploadFolder;
	
	@Autowired
	private ProductService productService;
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(path="/upload", method = {RequestMethod.POST,RequestMethod.GET})
	public String uploadindex(Model m) {
		
		return "uploadimg/uploadindex";
		
		
	}
	
	
	@RequestMapping(path="/uploadfile", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody ResponseEntity<?> uploadproduct (@RequestParam("name") String name,
			@RequestParam("price") double price, @RequestParam("description") String description, Model model, HttpServletRequest request
			,final @RequestParam("image") MultipartFile file){
	try {
		String uploadDirectory = request.getServletContext().getRealPath(uploadFolder);  // 找到上傳路徑
		log.info("uploadDirectory:: " + uploadDirectory);
		
		String fileName = file.getOriginalFilename();   // 找到原始檔案名稱
		String filePath = Paths.get(uploadDirectory, fileName).toString();     // 匯入nio 這需要了解一下，代替原本的io
		
		log.info("FileName: " + file.getOriginalFilename());
		
		
		if (fileName == null || fileName.contains("..")) {   // 查看檔案名稱是否錯誤，這個可能要再改
			model.addAttribute("invalid", "Sorry! Filename contains invalid path sequence \" + fileName");
			return new ResponseEntity<>("Sorry! Filename contains invalid path sequence " + fileName, HttpStatus.BAD_REQUEST);
		}
		
		Date createDate = new Date();  //沒有建構子會寫入現在時間
		try {
			File dir = new File(uploadDirectory);  // 從這邊開始開啟檔案，剛剛的檔案路徑在上方已經列印過了，檢查一下是不是正確
			if (!dir.exists()) {
				log.info("Folder Created");
				dir.mkdirs();
			}
			// Save the file locally
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
			stream.write(file.getBytes());
			stream.close();
		} catch (Exception e) {
			log.info("in catch");
			e.printStackTrace();
		}
		byte[] imageData = file.getBytes();
		ProductBean product = new ProductBean();
		product.setProductName(name);
		product.setProductImage(imageData);
		product.setProductPrice(price);
		product.setProductDescription(description);
		product.setCreateTime(createDate);
		productService.saveProductBean(product);
		log.info("HttpStatus===" + new ResponseEntity<>(HttpStatus.OK));
		return new ResponseEntity<>("Product Saved With File - " + fileName, HttpStatus.OK);
		}
	catch (Exception e) {
		e.printStackTrace();
		log.info("Exception: " + e);
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/product/display/{id}")
	@ResponseBody
	public void showImage(@PathVariable("id") int id, HttpServletResponse response, Optional<ProductBean> product) throws ServletException, IOException {
		log.info("Id :: " + id);
		product = productService.getProductById(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(product.get().getProductImage());
		response.getOutputStream().close();
	}
	
	@GetMapping("/product/productdetails")
	String showProductDetails(@RequestParam("id") int id, Optional<ProductBean> product, Model model) {
		try {
			log.info("Id :: " + id);
			if (id != 0) {
			product = productService.getProductById(id);
			
				log.info("products :: " + product);
				if (product.isPresent()) {
					model.addAttribute("id", product.get().getProductId());
					model.addAttribute("description", product.get().getProductDescription());
					model.addAttribute("name", product.get().getProductPrice());
					model.addAttribute("price", product.get().getProductPrice());
					return "productdetails";
				}
				return "redirect:/home";
			}
		return "redirect:/home";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/home";
		}	
	}
	

	@GetMapping("/product/show")
	String show(Model map) {
		List<ProductBean> products = productService.getAllActiveProducts();
		map.addAttribute("products", products);
		return "uploadimg/products";
	}


}
