package com.chinasofti.crm.utils;

import com.chinasofti.crm.biz.ServiceBiz;
import com.chinasofti.crm.domain.Service;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.annotation.Resource;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class ServiceExcelUtil {

    public static void getExcel(String path, String name, String sheetName, List lists, Object... objects) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        //用于时间的转换
        CreationHelper creationHelper = workbook.getCreationHelper();
        XSSFSheet sheet = workbook.createSheet(sheetName);
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setDataFormat(
                creationHelper.createDataFormat().getFormat("yyyy-MM-dd hh:mm:ss")
        );
        int rowNum = 0;
        //表头内容的初始化
        int colTitle = 0;
        if (lists.get(0) instanceof Service) {
            List<Service> services = lists;

            Row rowtitle = sheet.createRow(rowNum++);
            rowtitle.createCell(colTitle++).setCellValue("服务编号");
            rowtitle.createCell(colTitle++).setCellValue("客户名称");
            rowtitle.createCell(colTitle++).setCellValue("概要");
            rowtitle.createCell(colTitle++).setCellValue("服务类型");
            rowtitle.createCell(colTitle++).setCellValue("服务请求");
            rowtitle.createCell(colTitle++).setCellValue("创建人");
            rowtitle.createCell(colTitle++).setCellValue("创建日期");
            rowtitle.createCell(colTitle++).setCellValue("分配给");
            rowtitle.createCell(colTitle++).setCellValue("分配时间");
            rowtitle.createCell(colTitle++).setCellValue("处理人");
            rowtitle.createCell(colTitle++).setCellValue("处理时间");
            rowtitle.createCell(colTitle++).setCellValue("处理结果");
            rowtitle.createCell(colTitle++).setCellValue("满意度");

            for (Service service : services) {
                //分配每一行
                Row row = sheet.createRow(rowNum++);
                //分配每一列
                int colNum = 0;

                //为单元格赋值
                try {
                    row.createCell((short) 0).setCellValue(service.getServiceId());
                    row.createCell((short) 1).setCellValue(service.getCusName());
                    row.createCell((short) 2).setCellValue(service.getServiceOutline());
                    row.createCell((short) 3).setCellValue(service.getServiceType());
                    row.createCell((short) 4).setCellValue(service.getServiceRequest());
                    row.createCell((short) 5).setCellValue(service.getServiceCreateUser());
                    row.createCell((short) 6).setCellValue(service.getServiceCreateTime().toString());
                    row.createCell((short) 7).setCellValue(service.getServiceAlloUser());
                    row.createCell((short) 8).setCellValue(service.getServiceAlloTime().toString());
                    row.createCell((short) 9).setCellValue(service.getServiceDealUser());
                    row.createCell((short) 10).setCellValue(service.getServiceDealTime().toString());
                    row.createCell((short) 11).setCellValue(service.getServiceDealResult());
                    row.createCell((short) 12).setCellValue(service.getServiceSatisfy());
                } catch (Exception e) {
                    System.out.println("ServiceExcelUtil抛出了单元格空异常");
                }
            }
                try {
                    FileOutputStream outputStream = new FileOutputStream(path + "/" + name + ".xlsx");
                    workbook.write(outputStream);
                    workbook.close();
                } catch (FileNotFoundException e) {
                    System.out.println("ServiceExcelUtil抛出了FileNotFoundException异常");
                } catch (IOException e) {
                    System.out.println("ServiceExcelUtil抛出了IOException异常");
                }

        }
    }
}

