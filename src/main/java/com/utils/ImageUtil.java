package com.utils;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.Part;

public class ImageUtil {
    public String getImageNameFromPart(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        String imageName = null;
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        if (imageName == null || imageName.isEmpty()) {
            imageName = "default.jpg";
        }
        return System.currentTimeMillis() + "_" + imageName;
    }

    public boolean uploadImage(Part part, String rootPath, String fileName) {
        // builds the full path like "C:/.../gainsAndGears/uploads"
     
        
        File fileSaveDir = new File(rootPath);
        
        // creates the uploads folder if it doesnt exist yet
        if (!fileSaveDir.exists()) {
        	fileSaveDir.mkdirs();
        }
        
        try {
            // builds full file path like "C:/.../gainsAndGears/uploads/john.jpg"
            String filePath = rootPath + fileName;
            part.write(filePath);
            return true; 
        } catch (IOException e) {
            e.printStackTrace();
            return false; 
    }
}
}