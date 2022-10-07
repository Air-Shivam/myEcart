package com.glkc.helper;

public class Helper {

	public static  String get10Words(String s) {
		
	    String []st=s.split(" ");
		if(st.length>10) {
			String res="";
			for(int i=0;i<10;i++) {
				res+=st[i]+" ";
			}
			return res+"...";
		}else {
			return s+"...";
		}
		
	}
	
	
}
