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

    public boolean uploadImage(Part part, String rootPath, String saveFolder) {
        // builds the full path like "C:/.../gainsAndGears/uploads"
        String savePath = rootPath + saveFolder;
        
        File fileSaveDir = new File(savePath);
        
        // creates the uploads folder if it doesnt exist yet
        if (!fileSaveDir.exists()) {
            if (!fileSaveDir.mkdir()) {
                return false; // couldnt create folder, something went wrong
            }
        }
        
        try {
            String imageName = getImageNameFromPart(part);
            // builds full file path like "C:/.../gainsAndGears/uploads/john.jpg"
            String filePath = savePath + "/" + imageName;
            part.write(filePath);
            return true; 
        } catch (IOException e) {
            e.printStackTrace();
            return false; 
    }
}
}