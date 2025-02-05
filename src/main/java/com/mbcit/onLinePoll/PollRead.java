package com.mbcit.onLinePoll;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class PollRead {

// 텍스트 파일 이름을 넘겨받아 내용을 읽어서 ArrayList에 저장해서 리턴하는 메소드
	
	public static ArrayList<String> pollRead(String filepath) {
		
		ArrayList<String> poll = null; // 텍스트 파일의 내용을 읽어서 리턴시킬 객체를 선언한다.
		Scanner sc = null; // 텍스트 파일의 내용을 읽어들일 스캐너
		
		try {
			sc = new Scanner(new File(filepath));
			poll = new ArrayList<String>();
			
//			텍스트 파일의 끝까지(더 이상 읽어들일 줄이 없을 때 까지) 반복하며 텍스트 파일의 내용을 읽어서
//			ArrayList에 저장한다.
			
			while (sc.hasNextLine()) { 
				String str = sc.nextLine().trim();
//				읽어들인 줄이 빈 줄이 아닐 때 ArrayList poll에 저장한다. 
				if (str.length() >0) {
					poll.add(str);
				}
			}
			System.out.println("텍스트 파일에서 읽기 완료");
			
		} catch (FileNotFoundException e) {
			System.out.println("경로가 틀렸거나 파일이 없습니다.");
		}
		return poll;
	}
	
}
