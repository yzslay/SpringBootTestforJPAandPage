package com.petpet.upload;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;





@Controller
public class UploadPicController {
	
	@Value("${uploadDir}")
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
		String uploadDirectory = request.getServletContext().getRealPath(uploadFolder);  // 找到上傳路徑
		log.info("uploadDirectory:: " + uploadDirectory);
		String fileName = file.getOriginalFilename();   // 找到原始檔案名稱
		log.info("FileName: " + file.getOriginalFilename());
		return 	new ResponseEntity<>("Product Saved With File - " + fileName, HttpStatus.OK);
	}

}
