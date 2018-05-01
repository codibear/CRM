package com.chinasofti.crm.utils;

import com.chinasofti.crm.domain.Quotation;
import org.apache.poi.hssf.usermodel.*;

import java.io.FileOutputStream;
import java.util.List;

/**
 * Created by Administrator on 2017/8/13.
 */
public class QuotationExcelUtil {
    /**
     * @功能：手工构建一个简单格式的Excel
     */
    public static void Excel(List<Quotation> l) throws Exception
    {
        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("报价表一");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("报价编号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1);
        cell.setCellValue("产品报价");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("实施报价");
        cell.setCellStyle(style);
        cell = row.createCell((short) 3);
        cell.setCellValue("服务报价");
        cell.setCellStyle(style);
        cell = row.createCell((short) 4);
        cell.setCellValue("专项服务报价");
        cell.setCellStyle(style);
        cell = row.createCell((short) 5);
        cell.setCellValue("项目损益运算");
        cell.setCellStyle(style);
        cell = row.createCell((short) 6);
        cell.setCellValue("总价");
        cell.setCellStyle(style);
        cell = row.createCell((short) 7);
        cell.setCellValue("报价状态");
        cell.setCellStyle(style);
        cell = row.createCell((short) 8);
        cell.setCellValue("报价创建人");
        cell.setCellStyle(style);
        cell = row.createCell((short) 9);
        cell.setCellValue("订单编号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 10);
        cell.setCellValue("处理人");
        cell.setCellStyle(style);
        cell = row.createCell((short) 11);
        cell.setCellValue("客户名称");
        cell.setCellStyle(style);

        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，

        for (int i = 0; i <l.size(); i++)
        {
            row = sheet.createRow((int) i + 1);
            Quotation quotation=l.get(i);
            // 第四步，创建单元格，并设置值
            row.createCell((short) 0).setCellValue(quotation.getQuotationId());
            row.createCell((short) 1).setCellValue(quotation.getQuotationSales());
            row.createCell((short) 2).setCellValue(quotation.getQuotationImplementation());
            row.createCell((short) 3).setCellValue(quotation.getQuotationService());
            row.createCell((short) 4).setCellValue(quotation.getQuotationSpecialservice());
            row.createCell((short) 5).setCellValue(quotation.getQuotationBudget());
            row.createCell((short) 6).setCellValue(quotation.getQuotationTotal());
            row.createCell((short) 7).setCellValue(quotation.getQuotationStatus());
            row.createCell((short) 8).setCellValue(quotation.getQuotationCreater());
            row.createCell((short) 9).setCellValue(quotation.getOrderId());
            row.createCell((short) 10).setCellValue(quotation.getProcessor());
            row.createCell((short) 11).setCellValue(quotation.getClientName());
        }
        // 第六步，将文件存到指定位置
        try
        {
            FileOutputStream fout = new FileOutputStream("D:/quotation.xls");
            wb.write(fout);
            fout.close();


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
