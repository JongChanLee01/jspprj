package util;

import java.io.*;

public class FileUtil {
	public static void saveImage(String root, String fname, byte[] data) throws IOException {
		root += "/images";

		File f = new File(root);
		
		// root에 해당하는 디렉토리 없으면, 부모 디렉토리 포함해 모든 디렉토리 생성 불가
		if (!f.exists())
			f.mkdir();

		f = new File(root + "/" + fname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
	}
}