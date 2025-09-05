package kr.ac.kopo;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RootController {
	private final String path = "d:/upload/";
	
	private List<Image> list = new ArrayList<Image>();
	
	@GetMapping("/")
	String index(Model model) {
		model.addAttribute("list", list);
		return "index";
	}
	
	//파일업로드
	@PostMapping("/upload")
	String upload(Image item, MultipartFile uploadFile) {
		if(!uploadFile.isEmpty()) {
			String filename = uploadFile.getOriginalFilename();
			
			String uuid = UUID.randomUUID().toString();
			
			//임시 저장소에서 내가 지정한 저장소로 복붙하는것
			try {
				uploadFile.transferTo(new File(path + uuid + "_" + filename));
				item.setUuid(uuid);
				item.setFilename(filename);
				
				list.add(item);
			}catch(Exception e) {
				e.printStackTrace();
			}
		} 
		return "redirect:.";
	}
	
	//AJAX로 파일업로드
	@ResponseBody
	@PostMapping(value="/upload/ajax", produces="application/json; charset=UTF-8")
	String upload_ajax(Image item, MultipartFile uploadFile) {
		upload(item, uploadFile);
		return "{"
        + "\"title\":\"" + item.getTitle() + "\","
        + "\"uuid\":\"" + item.getUuid() + "\","
        + "\"filename\":\"" + item.getFilename() + "\""
        + "}";
	}
}
