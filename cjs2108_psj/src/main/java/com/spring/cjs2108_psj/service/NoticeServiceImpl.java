package com.spring.cjs2108_psj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.cjs2108_psj.dao.NoticeDAO;
import com.spring.cjs2108_psj.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDAO noticeDAO;

	@Override
	public int totRecCnt() {
		return noticeDAO.totRecCnt();
	}

	@Override
	public List<NoticeVO> getNoticeAdmin(int startIndexNo, int pageSize) {
		return noticeDAO.getNoticeAdmin(startIndexNo, pageSize);
	}

	@Override
	public void setBoardInput(NoticeVO vo) {
		noticeDAO.setBoardInput(vo);		
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public void imgCheck(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/");
		int position= 32;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		while(true) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile; // 원본 그림이 들어있는 '경로명+파일명'
			copyFilePath = uploadPath + "notice/" + imgFile; // 복사가 될 경로명 + 파일명
			fileCopyCheck(oriFilePath, copyFilePath); // 원본그림이 복사될 위치로 복사작업처리하는 메소드
			if(nextImg.indexOf("src=\"/") != -1) {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
			else {
				return;
			}
		}
	}
	// 실제 파일(ckeditor폴더)을 board폴더로 복사처리하는곳
	private void fileCopyCheck(String oriFilePath, String copyFilePath){
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		try {
			FileInputStream fis = new FileInputStream(oriFile);
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

	@Override
	public NoticeVO getNoticeContent(int idx) {
		return noticeDAO.getNoticeContent(idx);
	}

	@Override
	public List<NoticeVO> getPreNext(int idx) {
		return noticeDAO.getPreNext(idx);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void imgCheckUpdate(String content) {
		//             0         1         2       2 3    3    4         5
		//             012345678901234567890123456789012345678901234567890
		// <img alt="" src="/cjs2108_psj/data/ckeditor/211229124318_4.jpg"
		// <img alt="" src="/cjs2108_psj/data/ckeditor/notice/211229124318_4.jpg"
		if(content.indexOf("src=\"/") == -1) return;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/notice/");
		int position = 39;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
			String copyFilePath = request.getRealPath("/resources/data/ckeditor/" + imgFile);	// 복사가 될 '경로명+파일명'
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
	public void imgDelete(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/notice/");
		int position = 39;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
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
	
	@Override
	public void setNoticeUpdate(NoticeVO vo) {
		noticeDAO.setNoticeUpdate(vo);
	}

	@Override
	public void setNoticeServiceDelete(int idx) {
		noticeDAO.setNoticeServiceDelete(idx);
	}

	@Override
	public void setNoticeDelete(int idx) {
		noticeDAO.setNoticeDelete(idx);
	}

	@Override
	public void setNoticeLevel(int idx, int notice) {
		noticeDAO.setNoticeLevel(idx,notice);
	}
}
