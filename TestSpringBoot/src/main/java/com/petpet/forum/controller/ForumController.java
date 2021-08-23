package com.petpet.forum.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.petpet.forum.model.Forum;
import com.petpet.forum.model.ImageUpload;
import com.petpet.forum.service.ForumService;

@Controller
public class ForumController {

	@Value("${uploadDir}")
	private String uploadFolder;
	
	@Autowired
	private  ForumService forumservice;
	
	@RequestMapping(path={"/forumquery.controller",}, method = {RequestMethod.POST,RequestMethod.GET})
	public String listAllForum(Model m) {
		List<Forum> forum = forumservice.queryall();
		m.addAttribute("forum", forum);
		return 	"forum/forumall";
	}
	
	
	
	@RequestMapping(path={"/inputforum.controller"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String foruminsert(Model m, @RequestParam("title") String title,  @RequestParam("article") String article  ) {
		Forum forum = new Forum();
		forum.setForumtext(article);
		forum.setForumTitle(title);
		forumservice.insert(forum);
		List<Forum> forums= forumservice.queryall();
		m.addAttribute("forum", forums);
		return 	"forum/forumall";
	}
	
	@RequestMapping(path={"/enterforum.controller"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String forumEnter(Model m) {
		return 	"forum/inputforum";
	}
	@RequestMapping(path={"/delete.controller"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String forumdelete(Model m , @RequestParam("id") int id) {
		forumservice.delete(id);
		return 	"forum/inputforum";
	}
	

	@RequestMapping(path={"/images/ckeditorUpload"}, method = {RequestMethod.POST,RequestMethod.GET})
	public  @ResponseBody ImageUpload ckeditorUpload(@RequestParam("upload") MultipartFile file,HttpServletRequest request) throws IOException {
		
		//為了抓副檔名
		String filename = StringUtils.cleanPath(file.getOriginalFilename());
		filename = filename.toLowerCase().replaceAll(" ", "-");
		//得到副檔名
		String suffixName = filename.substring(filename.lastIndexOf("."));
		//用UUID新建檔名
		String newFileName = UUID.randomUUID().toString() + suffixName;
		String uploadDirectory = request.getServletContext().getRealPath(uploadFolder);
        File saveFile1Path=new File(uploadDirectory,newFileName);//指定路徑跟名稱
		String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+uploadFolder+"/"+newFileName;
		System.out.println(url);
		System.out.println(newFileName);

        file.transferTo(saveFile1Path);
        
        ImageUpload imageUpload = new ImageUpload();
        imageUpload.setUploaded(1);
        imageUpload.setFileName(filename);
        imageUpload.setUrl(url);
        
		return imageUpload;
}


}