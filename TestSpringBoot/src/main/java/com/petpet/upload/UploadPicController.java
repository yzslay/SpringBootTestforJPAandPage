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
	
	@Value("${uploadDir}")  // 從application,properties 裡獲得圖片路徑，resources之下
	private String uploadFolder;
	
	@Autowired
	private ProductService productService; //不用new物件很棒
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());  
	
	@RequestMapping(path="/upload", method = {RequestMethod.POST,RequestMethod.GET})  // 首頁位置
	public String uploadindex(Model m) {
		
		return "uploadimg/uploadindex";

	}
	
	@RequestMapping(path="/uploadfile", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<?> uploadproduct (@RequestParam("name") String name,
			@RequestParam("price") double price, @RequestParam("description") String description, Model model, HttpServletRequest request
			,final @RequestParam("image") MultipartFile file){
	try {
		String uploadDirectory = request.getServletContext().getRealPath(uploadFolder);  // 瀏覽器的上傳路徑，這邊要注意沒有對Linux作修正，要的話要再改
		log.info("uploadDirectory:: " + uploadDirectory);
		
		String fileName = file.getOriginalFilename();   // 找到原始檔案名稱
		String filePath = Paths.get(uploadDirectory, fileName).toString();     // 匯入nio 這需要了解一下，代替原本的io
		
		log.info("FileName: " + file.getOriginalFilename());
		
		if (fileName == null || fileName.contains("..")) {   // 查看檔案名稱是否錯誤，這個可能要再改，避免給出不是圖檔的東西
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
			//就儲存到file物件...反正要再研究一下
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
			stream.write(file.getBytes()); 
			stream.close();
		} catch (Exception e) {
			log.info("in catch");
			e.printStackTrace();
		}
		// file轉換成byte物件
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
	
	@GetMapping("/product/display/{id}")  // 用來匯出資料庫的圖片
	@ResponseBody
	public void showImage(@PathVariable("id") int id, HttpServletResponse response, Optional<ProductBean> product) throws ServletException, IOException {
		log.info("Id :: " + id);
		product = productService.getProductById(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(product.get().getProductImage());
		response.getOutputStream().close();
	}
	
	@GetMapping("/product/productdetails")   // 找尋產品明細 ，尚未實作
	public String showProductDetails(@RequestParam("id") int id, Optional<ProductBean> product, Model model) {
		try {
			log.info("Id :: " + id);
			if (id != 0) {
			product = productService.getProductById(id);
			
				log.info("products :: " + product);
				if (product.isPresent()) {
					model.addAttribute("id", product.get().getProductId());
					model.addAttribute("description", product.get().getProductDescription());
					model.addAttribute("name", product.get().getProductName());
					model.addAttribute("price", product.get().getProductPrice());
					return "/uploadimg/productdetails";
				}
				return "redirect:/upload";  
			}
		return "redirect:/home";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/upload";
		}	
	}
	
	@RequestMapping(path="/updatefile", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<?> upldateproduct (@RequestParam("name") String name, @RequestParam("id") int id,
			@RequestParam("price") double price, @RequestParam("description") String description, Model model, HttpServletRequest request
			,final @RequestParam(value="image",  required = false) MultipartFile file){
		try {
			System.out.println("有沒有檔案"+file);
			String fileName1 = file.getOriginalFilename();
			System.out.println("有沒有檔案名稱"+fileName1);
			if (! file.isEmpty()) {   // 檔案不為空才讀取檔案，否則就用原本資料庫裏面的檔案
			
				String uploadDirectory = request.getServletContext().getRealPath(uploadFolder);  // 瀏覽器的上傳路徑，這邊要注意沒有對Linux作修正，要的話要再改
				log.info("uploadDirectory:: " + uploadDirectory);
				
				String fileName = file.getOriginalFilename();   // 找到原始檔案名稱
				String filePath = Paths.get(uploadDirectory, fileName).toString();     // 匯入nio 這需要了解一下，代替原本的io
		
				log.info("FileName: " + file.getOriginalFilename());
				
				if (fileName == null || fileName.contains("..")) {   // 查看檔案名稱是否錯誤，這個可能要再改，避免給出不是圖檔的東西
					model.addAttribute("invalid", "Sorry! Filename contains invalid path sequence \" + fileName");
					return new ResponseEntity<>("Sorry! Filename contains invalid path sequence " + fileName, HttpStatus.BAD_REQUEST);
				}
				
				try {
					File dir = new File(uploadDirectory);  // 從這邊開始開啟檔案，剛剛的檔案路徑在上方已經列印過了，檢查一下是不是正確
					if (!dir.exists()) {
						log.info("Folder Created");
						dir.mkdirs();
					}
					}catch (Exception e) {
						log.info("in catch");
						e.printStackTrace();
					}
				}
			Date createDate = new Date();  //變成是現在的修改時間匯入

			ProductBean product = productService.getProductById(id).orElse(null);
				
			byte[] imageData1= product.getProductImage();
			
			product.setProductImage(imageData1);
			System.out.println("這裡是image:"+imageData1);
			//檔案不為空才讀取檔案，否則就用原本資料庫裏面的檔案
			if (!file.isEmpty()) {	
				byte[] imageData = file.getBytes();
				product.setProductImage(imageData);
			}
			product.setProductName(name);
			product.setProductPrice(price);
			product.setProductDescription(description);
			product.setCreateTime(createDate);
			productService.saveProductBean(product);
			log.info("HttpStatus===" + new ResponseEntity<>(HttpStatus.OK));
			return new ResponseEntity<>("Product Saved With File", HttpStatus.OK);
		}	
		
		catch (Exception e) {
			e.printStackTrace();
			log.info("Exception: " + e);
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}

	@GetMapping("/productdelete")   // 產品刪除
	public ResponseEntity<?> deleteProductDetails(@RequestParam("id") int id, HttpServletResponse response,Model model) {
		try {
			log.info("Id :: " + id);
			if (id != 0) {
			Optional<ProductBean> product = productService.getProductById(id);
				System.out.println("moo");
				log.info("products :: " + product);
				if (product.isPresent()) {
					model.addAttribute("id", product.get().getProductId());
					model.addAttribute("description", product.get().getProductDescription());
					model.addAttribute("name", product.get().getProductPrice());
					model.addAttribute("price", product.get().getProductPrice());
					productService.deleteProduct(id);
					return new ResponseEntity<>("Delete Sucess", HttpStatus.OK);
				}
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);  
			}
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}	
	}

	@GetMapping("/product/show")    // 找尋所有產品 
	public String show(Model map) {
		List<ProductBean> products = productService.getAllActiveProducts();
		map.addAttribute("products", products);
		return "uploadimg/products";
	}


}
