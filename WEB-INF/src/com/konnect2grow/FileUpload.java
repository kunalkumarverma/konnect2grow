package com.wgai;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
	private static final String TMP_DIR_PATH = "c:";
	private File tmpDir;
	private static final String DESTINATION_DIR_PATH ="/images";
	private File destinationDir;

	public boolean upload(HttpServletRequest request, ServletContext context) {
		
		String realPath = context.getRealPath(DESTINATION_DIR_PATH);
		destinationDir = new File(realPath);
		if(!destinationDir.isDirectory()) {
			System.out.println(DESTINATION_DIR_PATH+" is not a directory");
		}
	
	 // PrintWriter out = response.getWriter();
	    
		DiskFileItemFactory  fileItemFactory = new DiskFileItemFactory ();
		fileItemFactory.setSizeThreshold(5*1024*1024); //5 MB
		//fileItemFactory.setRepository(tmpDir);
		ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
		boolean val=false;
		try {
			List items = uploadHandler.parseRequest(request);
			Iterator itr = items.iterator();
			while(itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
					if(item.isFormField()) {
					//out.println("File Name = "+item.getFieldName()+", Value = "+item.getString());
				} else {
					//Handle Uploaded files.
					//out.println("Field Name = "+item.getFieldName()+", File Name = "+item.getName()+
					//	", Content type = "+item.getContentType()+
					//	", File Size = "+item.getSize());
					//File file = new File(destinationDir,item.getName());
					System.out.println(item.getName());
					File file=null;
					String itemName=item.getName();
				if(itemName.lastIndexOf("\\") >= 0 ){
               			file = new File(destinationDir+ itemName.substring( itemName.lastIndexOf("\\"))) ;
           			 }else{
               			file = new File( destinationDir +itemName.substring(itemName.lastIndexOf("\\")+1)) ;
            			}

					//File savedFile = new File(destinationDir+"\\"+itemName);
   					item.write(file);
					val=true;

					//item.write(file);
					System.out.println("success");
				}
				
				}
		}catch(FileUploadException ex) {
			System.out.println("Error encountered while parsing the request "+ex);
		} catch(Exception ex) {
		System.out.println("Error encountered while uploading file "+ ex);
		}
		return val;
	}
}
