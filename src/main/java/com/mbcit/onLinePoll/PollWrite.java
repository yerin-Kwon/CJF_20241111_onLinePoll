package com.mbcit.onLinePoll;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class PollWrite {
	
//	텍스트 파일 이름과 텍스트 파일에 저장할 데이터(ArrayList)를 넘겨받아 텍스트 파일에 저장하는 메소드
	
	public static void pollWrite(String filepath, ArrayList<String> poll) {
		
//		ArrayList에 저장된 데이터를 텍스트 파일로 출력하기 위해 PrintWriter 클래스 객체를 선언한다.
		PrintWriter pw = null;
		
		try {
//			텍스트 파일로 출력하기 위해 PrintWriter 클래스 객체를 생성한다.
			pw = new PrintWriter(filepath);
			
//			ArrayList에 저장된 데이터의 개수만큼 반복하며 텍스트 파일로 출력한다.
			for (String str : poll) {
				pw.write(str + "\r\n");
			}
		} catch (FileNotFoundException e) {
			System.out.println("경로가 틀렸거나 파일이 없습니다.");
		} finally {
//			파일로 출력하는 객체를 close() 메소드를 실행해서 닫지않으면 파일에 데이터가 저장되지 않는다.
			pw.close();
		}
	}
}
