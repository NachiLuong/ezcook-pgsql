package com.ezcook.utils;

import com.ezcook.constants.WebConstant;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UploadUtil {
    private final int maxMemorySize = 1024*1024*3;
    private final int maxRequestSize = 1024*1024*50;
    public  Object[]  writeOrUpdateFile(HttpServletRequest request, Set<String> titleValue, String path)  {

        String address = "/"+ WebConstant.FOLDER_UPLOAD;
        checkAndCreatFolder(address,path);
        boolean check=true;
        String fileLocation=null;
        String name=null;
        Map<String,String> mapReturnValue= new HashMap<>();
        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(!isMultipart) check=false;
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Set factory constraints
        factory.setSizeThreshold(maxMemorySize);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(maxRequestSize);

        // Parse the request
        try {
            List<FileItem> items = upload.parseRequest(request);
            for(FileItem item:items){
                if(!item.isFormField()){
                    name=item.getName();
                    if(StringUtils.isNotBlank(name)){
                        File upLoadFile= new File(address + File.separator+ path + File.separator + name);
                        fileLocation=address + File.separator+ path + File.separator + name;
                        boolean isExist=upLoadFile.exists();
                        try {
                            if(isExist){
                                upLoadFile.delete();
                            }
                            item.write(upLoadFile);
                        }catch (Exception e){
                            check=false;
                        }
                    }
                }
                else {
                    if(titleValue!=null){
                        String nameField= item.getFieldName();
                        String valueField= null;
                        try {
                            valueField = item.getString("UTF-8");
                        } catch (UnsupportedEncodingException ignored) {
                        }
                        if(titleValue.contains(nameField)){
                            mapReturnValue.put(nameField,valueField);
                        }
                    }
                }
            }
        }catch (FileUploadException e){
            check=false;
        }

        return new  Object[]{check, fileLocation,path + File.separator + name, mapReturnValue};
    }

    private void checkAndCreatFolder(String address, String path) {
        File folderRoot= new File(address);
        if(!folderRoot.exists()){
            folderRoot.mkdirs();
        }
        File folderChild = new File(address + File.separator + path);
        if(!folderChild.exists()){
            folderChild.mkdirs();
        }
    }


}
