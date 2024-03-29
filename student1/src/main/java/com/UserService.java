package com;

import com.mysql.cj.util.StringUtils;

public class UserService {
	static final String userid_필수 = "학생은 학번 교수는 아이디를 입력하세요.";
	static final String name_필수 = "이름을 입력하세요.";
	static final String userType_필수 = "교수인지 학생인지 입력하세요.";
	static final String userid_중복 = "유저아이디가 중복입니다..";
	static final String 작업_실패 = "작업 도중 오류가 발생했습니다.";
	
	
	public static String validate(User user) throws Exception {
        if (StringUtils.isEmptyOrWhitespaceOnly(user.getUserid()))
            return userid_필수;
        if (StringUtils.isEmptyOrWhitespaceOnly(user.getName()))
            return name_필수;
        if (user.getUserType() == "")
            return userType_필수;
        User user1 = UserDAO2.findByUserId(user.getUserid());
        if (user1 != null && user1.getId() != user.getId())
            return userid_중복;
        return null;
    }
	
	public static String insert(User user) {
        try {
            String errorMessage = validate(user);
            if (errorMessage != null) return errorMessage;
            UserDAO2.insert(user);
            return null;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return 작업_실패;
        }
    }

 
    public static String update(User user) {
        try {
            String errorMessage = validate(user);
            if (errorMessage != null) return errorMessage;
            UserDAO2.update(user);
            return null;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return 작업_실패;
        }
    }

 

    public static String delete(int id) {
        try {
            UserDAO2.delete(id);
            return null;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return 작업_실패;
        }
    }
}
