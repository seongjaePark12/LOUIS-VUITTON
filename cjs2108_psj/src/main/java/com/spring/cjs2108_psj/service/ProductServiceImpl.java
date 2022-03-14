package com.spring.cjs2108_psj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_psj.dao.ProductDAO;
import com.spring.cjs2108_psj.vo.CategoryVO;
import com.spring.cjs2108_psj.vo.OptionVO;
import com.spring.cjs2108_psj.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;

	@Override
	public List<CategoryVO> getCategoryMain() {
		return productDAO.getCategoryMain();
	}

	@Override
	public List<CategoryVO> getCategoryMiddle() {
		return productDAO.getCategoryMiddle();
	}

	@Override
	public List<CategoryVO> getCategorySub() {
		return productDAO.getCategorySub();
	}

	@Override
	public List<CategoryVO> getCategoryMiddleName(String categoryMainCode) {
		return productDAO.getCategoryMiddleName(categoryMainCode);
	}

	@Override
	public List<CategoryVO> getCategorySubName(String categoryMainCode, String categoryMiddleCode) {
		return productDAO.getCategorySubName(categoryMainCode,categoryMiddleCode);
	}

	@Override
	public CategoryVO getCategoryMainOne(String categoryMainCode, String categoryMainName) {
		return productDAO.getCategoryMainOne(categoryMainCode,categoryMainName);
	}

	@Override
	public void categoryMainInput(CategoryVO vo) {
		productDAO.categoryMainInput(vo);		
	}

	@Override
	public List<CategoryVO> getCategoryMiddleOne(CategoryVO vo) {
		return productDAO.getCategoryMiddleOne(vo);
	}

	@Override
	public void categoryMiddleInput(CategoryVO vo) {
		productDAO.categoryMiddleInput(vo);		
	}

	@Override
	public List<CategoryVO> getCategorySubOne(CategoryVO vo) {
		return productDAO.getCategorySubOne(vo);
	}

	@Override
	public void categorySubInput(CategoryVO vo) {
		productDAO.categorySubInput(vo);
	}

	@Override
	public void delCategoryMain(String categoryMainCode) {
		productDAO.delCategoryMain(categoryMainCode);		
	}

	@Override
	public void delCategoryMiddle(String categoryMiddleCode) {
		productDAO.delCategoryMiddle(categoryMiddleCode);		
	}

	@Override
	public List<ProductVO> getDbProductOne(String categorySubCode) {
		return productDAO.getDbProductOne(categorySubCode);
	}

	@Override
	public void delCategorySub(String categorySubCode) {
		productDAO.delCategorySub(categorySubCode);		
	}

	@Override
	public ProductVO productCodeCheck(String productCode) {
		return productDAO.productCodeCheck(productCode);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void imgCheckProductInput(MultipartFile file, ProductVO vo) {
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != "" && originalFilename != null) {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			  String saveFileName = sdf.format(date) + "_" + originalFilename;
				writeFile(file, saveFileName);	  // 메인 이미지를 서버에 업로드 시켜주는 메소드 호출
				vo.setProductMainImg(saveFileName);				// 서버에 저장된 파일명을 vo에 set시켜준다.
			}
			else {
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		//             0         1         2         3         4         5
		//             012345678901234567890123456789012345678901234567890
		// <img alt="" src="/cjs2108_psj/data/shop/211229124318_4.jpg"
		// <img alt="" src="/cjs2108_psj/data/shop/product/211229124318_4.jpg"
		String content = vo.getProductSubImg();
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/shop/");
		
		int position = 28;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
			copyFilePath = uploadPath + "product/" + imgFile;	// 복사가 될 '경로명+파일명'
			fileCopyCheck(oriFilePath, copyFilePath);	// 원본그림이 복사될 위치로 복사작업처리하는 메소드
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
		vo.setProductSubImg(vo.getProductSubImg().replace("/data/shop/", "/data/shop/product/"));
 		productDAO.setProductInput(vo);
	}
	
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		try {
			FileInputStream  fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 메인 상품 이미지 서버에 저장하기
	private void writeFile(MultipartFile productMainImg, String saveFileName) throws IOException {
		byte[] data = productMainImg.getBytes();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/shop/product/");
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);
		fos.close();
	}

	@Override
	public List<CategoryVO> getCategoryProuctName(String categoryMainCode, String categoryMiddleCode, String categorySubCode) {
		return productDAO.getCategoryProuctName(categoryMainCode, categoryMiddleCode, categorySubCode);
	}

	@Override
	public void optionInput(OptionVO vo) {
		productDAO.optionInput(vo);
	}

	@Override
	public ProductVO getProductIdx(String categoryMainCode, String categoryMiddleCode, String categorySubCode) {
		return productDAO.getProductIdx( categoryMainCode, categoryMiddleCode, categorySubCode);
	}

	@Override
	public List<ProductVO> getShopList(int startIndexNo, int pageSize,String disPriceSw) {
		return productDAO.getShopList(startIndexNo,pageSize,disPriceSw);
	}

	@Override
	public int totRecCnt() {
		return productDAO.totRecCnt();
	}

	@Override
	public void setProductDelete(int idx) {
		productDAO.setProductDelete(idx);
	}

	@Override
	public int totRecProductNameCnt(String productName) {
		return productDAO.totRecProductNameCnt(productName);
	}

	@Override
	public List<ProductVO> getShopListProduct(int startIndexNo, int pageSize, String productName) {
		return productDAO.getShopListProduct(startIndexNo,pageSize,productName);
	}

	@Override
	public void setProductOPDelete(int idx) {
		productDAO.setProductOPDelete(idx);		
	}

	@Override
	public ProductVO getProductContent(int idx) {
		return productDAO.getProductContent(idx);
	}

	@Override
	public void setProductUpdate(MultipartFile file,ProductVO vo) {
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != "" && originalFilename != null) {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			  String saveFileName = sdf.format(date) + "_" + originalFilename;
				writeFile(file, saveFileName);	  // 메인 이미지를 서버에 업로드 시켜주는 메소드 호출
				vo.setProductMainImg(saveFileName);				// 서버에 저장된 파일명을 vo에 set시켜준다.
			}
			else {
				return;
			}
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		productDAO.setProductUpdate(vo);
	}
	
	@Override
	public void setOptionUpdate(OptionVO vo) {
		productDAO.setOptionUpdate(vo);	
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public void imgCheckUpdate(String productSubImg) {
				//     0         1         2         3         4         5
		//             012345678901234567890123456789012345678901234567890
		// <img alt="" src="/cjs2108_psj/data/shop/211229124318_4.jpg"
		// <img alt="" src="/cjs2108_psj/data/shop/product/211229124318_4.jpg"
		if(productSubImg.indexOf("src=\"/") == -1) return;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/shop/product/");
		int position = 36;
		String nextImg = productSubImg.substring(productSubImg.indexOf("src=\"/") + position);
		boolean sw = true;
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
			String copyFilePath = request.getRealPath("/resources/data/shop/" + imgFile);	// 복사가 될 '경로명+파일명'
			fileCopyCheck(oriFilePath, copyFilePath);	// 원본그림이 복사될 위치로 복사작업처리하는 메소드
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
		
	}
	@SuppressWarnings("deprecation")
	@Override
	public void imgDelete(String productSubImg) {
		if(productSubImg.indexOf("src=\"/") == -1) return;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/shop/product/");
		int position = 36;
		String nextImg = productSubImg.substring(productSubImg.indexOf("src=\"/") + position);
		boolean sw = true;
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
			fileDelete(oriFilePath);	// 원본그림을 삭제처리하는 메소드
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
	}
	// 원본이미지를 삭제처리하는곳(board폴더에서 삭제처리한다.)
	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();
	}
	@SuppressWarnings("deprecation")
	@Override
	public void imgCheck(String productSubImg) {
		if(productSubImg.indexOf("src=\"/") == -1) return;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/shop/");
		int position= 28;
		String nextImg = productSubImg.substring(productSubImg.indexOf("src=\"/") + position);
		while(true) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile; // 원본 그림이 들어있는 '경로명+파일명'
			copyFilePath = uploadPath + "product/" + imgFile; // 복사가 될 경로명 + 파일명
			fileCopyCheck(oriFilePath, copyFilePath); // 원본그림이 복사될 위치로 복사작업처리하는 메소드
			if(nextImg.indexOf("src=\"/") != -1) {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
			else {
				return;
			}
		}
	}


}
