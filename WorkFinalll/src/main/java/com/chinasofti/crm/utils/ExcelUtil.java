package com.chinasofti.crm.utils;

import com.chinasofti.crm.biz.SalesBiz;
import com.chinasofti.crm.domain.*;
import com.chinasofti.crm.domain.Log;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.annotation.Resource;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * Created by codiibear on 2017/8/10.
 * zero组报表用
 */
public class ExcelUtil {
    /**
     * @param path      保存路径
     * @param name      文件名称
     * @param sheetName 表明
     * @param lists     查询得到的list数据
     * @param objects   用来拓展
     */
    @Resource
    private static SalesBiz salesBiz;
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
        if (lists.get(0) instanceof Plan) {
            List<Plan> plans = lists;

            Row rowtitle = sheet.createRow(rowNum++);
            rowtitle.createCell(colTitle++).setCellValue("计划项编号");
            //rowtitle.createCell(colTitle++).setCellValue("客户名称");
            rowtitle.createCell(colTitle++).setCellValue("计划项");
            rowtitle.createCell(colTitle++).setCellValue("计划时间");
            rowtitle.createCell(colTitle++).setCellValue("执行效果");

            for (Plan p : plans) {
                //分配每一行
                Row row = sheet.createRow(rowNum++);
                //分配每一列
                int colNum = 0;

                //为单元格赋值
                row.createCell(colNum++).setCellValue(p.getPlanId());
                //row.createCell(colNum++).setCellValue(p.getSalesmanage().getCusName());
                row.createCell(colNum++).setCellValue(p.getPlanPro());
                Cell cell = row.createCell(colNum++);
                cell.setCellValue(p.getPlanTime());
                cell.setCellStyle(cellStyle);
                row.createCell(colNum++).setCellValue(p.getPlanResult());
            }
        }

        if (lists.get(0) instanceof SalesManage) {
            List<SalesManage> salesManages = lists;
            Row rowtitle = sheet.createRow(rowNum++);
            rowtitle.createCell(colTitle++).setCellValue("销售编号");
            rowtitle.createCell(colTitle++).setCellValue("客户名称");
            rowtitle.createCell(colTitle++).setCellValue("机会来源");
            rowtitle.createCell(colTitle++).setCellValue("成功几率");
            rowtitle.createCell(colTitle++).setCellValue("机会描述");
            rowtitle.createCell(colTitle++).setCellValue("概要");
            rowtitle.createCell(colTitle++).setCellValue("创建人");
            rowtitle.createCell(colTitle++).setCellValue("创建时间");
            rowtitle.createCell(colTitle++).setCellValue("指派人");
            rowtitle.createCell(colTitle++).setCellValue("指派时间");
            rowtitle.createCell(colTitle++).setCellValue("联系人");
            rowtitle.createCell(colTitle++).setCellValue("联系方式");

            for (SalesManage s : salesManages) {
                //分配每一行
                Row row = sheet.createRow(rowNum++);
                //分配每一列
                int colNum = 0;
                /*cellStyle.setDataFormat(
                        creationHelper.createDataFormat().getFormat("yyyy-MM-dd hh:mm:ss")
                );*/
                //为单元格赋值
                row.createCell(colNum++).setCellValue(s.getSalesId());
                row.createCell(colNum++).setCellValue(s.getCusName());
                row.createCell(colNum++).setCellValue(s.getOppSource());
                row.createCell(colNum++).setCellValue(s.getSuccRate());
                row.createCell(colNum++).setCellValue(s.getOppDesc());
                row.createCell(colNum++).setCellValue(s.getOutLine());
                row.createCell(colNum++).setCellValue(s.getCreatMan());
                Cell cell = row.createCell(colNum++);
                cell.setCellValue(s.getCreatTime());
                cell.setCellStyle(cellStyle);
                row.createCell(colNum++).setCellValue(s.getGiveMan());
                Cell cell1 = row.createCell(colNum++);
                cell1.setCellValue(s.getGiveTime());
                cell1.setCellStyle(cellStyle);
                row.createCell(colNum++).setCellValue(s.getLinkName());
                row.createCell(colNum++).setCellValue(s.getLinkPhone());
            }
        }

        if (lists.get(0) instanceof Log) {
            List<Log> logs = lists;
            Row rowtitle = sheet.createRow(rowNum++);
            rowtitle.createCell(colTitle++).setCellValue("用户编号");
            rowtitle.createCell(colTitle++).setCellValue("用户姓名");
            rowtitle.createCell(colTitle++).setCellValue("操作时间");
            rowtitle.createCell(colTitle++).setCellValue("访问的方法");
            rowtitle.createCell(colTitle++).setCellValue("IP地址");
            rowtitle.createCell(colTitle++).setCellValue("备注");
            for (Log log : logs) {
                //分配每一行
                Row row = sheet.createRow(rowNum++);
                //分配每一列
                int colNum = 0;
                /*cellStyle.setDataFormat(
                        creationHelper.createDataFormat().getFormat("yyyy-MM-dd hh:mm:ss")
                );*/
                //为单元格赋值
                row.createCell(colNum++).setCellValue(log.getUserId());
                row.createCell(colNum++).setCellValue(log.getUserName());
//                row.createCell(colNum++).setCellValue(log.getCreatetime());
                Cell cell2 = row.createCell(colNum++);
                cell2.setCellValue(log.getCreatetime());
                cell2.setCellStyle(cellStyle);
                row.createCell(colNum++).setCellValue(log.getMeothod());
                row.createCell(colNum++).setCellValue(log.getIP());
                row.createCell(colNum++).setCellValue(log.getMsg());
            }
        }
        if(lists.get(0) instanceof Quotation){
            List<Quotation> l=lists;
            /*// 第一步，创建一个webbook，对应一个Excel文件
            HSSFWorkbook wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet sheet2 = wb.createSheet(sheetName);
            // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
            HSSFRow row = sheet2.createRow((int) 0);
            // 第四步，创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle style = wb.createCellStyle();
            HSSFCell cell = row.createCell((short) 0);*/

            Row row = sheet.createRow(0);
            XSSFCellStyle style = workbook.createCellStyle();

            Row rowtitle = sheet.createRow(rowNum++);
            rowtitle.createCell(colTitle++).setCellValue("报价编号");
            rowtitle.createCell(colTitle++).setCellValue("产品报价");
            rowtitle.createCell(colTitle++).setCellValue("实施报价");
            rowtitle.createCell(colTitle++).setCellValue("服务报价");
            rowtitle.createCell(colTitle++).setCellValue("专项服务报价");
            rowtitle.createCell(colTitle++).setCellValue("项目损益运算");
            rowtitle.createCell(colTitle++).setCellValue("总价");
            rowtitle.createCell(colTitle++).setCellValue("报价状态");
            rowtitle.createCell(colTitle++).setCellValue("报价创建人");
            rowtitle.createCell(colTitle++).setCellValue("订单编号");
            rowtitle.createCell(colTitle++).setCellValue("处理人");
            rowtitle.createCell(colTitle++).setCellValue("客户名称");

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

        }

        if (lists.get(0) instanceof Customer) {
            List<Customer> customers = lists;
/*
* "编号", "客户编号", "客户名称", "地区", "联系人编号",
 * "联系人姓名", "客户等级", "客户满意度", "客户信用度", "地址",
 * "邮政编码", "电话", "传真", "网址", "营业执照注册号", "法人", "注册资金（万元）",
 * "年营业额", "开户银行", "银行账号", "地税局登记号", "国税局登记号", "状态"
* */
            Row rowtitle = sheet.createRow(rowNum++);
//            rowtitle.createCell(colTitle++).setCellValue("编号");
            rowtitle.createCell(colTitle++).setCellValue("客户编号");
            rowtitle.createCell(colTitle++).setCellValue("客户名称");
            rowtitle.createCell(colTitle++).setCellValue("地区");
            rowtitle.createCell(colTitle++).setCellValue("客户等级");
            rowtitle.createCell(colTitle++).setCellValue("客户满意度");
            rowtitle.createCell(colTitle++).setCellValue("客户信用度");
            rowtitle.createCell(colTitle++).setCellValue("地址");
            rowtitle.createCell(colTitle++).setCellValue("邮政编码");
            rowtitle.createCell(colTitle++).setCellValue("电话");
            rowtitle.createCell(colTitle++).setCellValue("传真");
            rowtitle.createCell(colTitle++).setCellValue("网址");
            rowtitle.createCell(colTitle++).setCellValue("营业执照注册号");
            rowtitle.createCell(colTitle++).setCellValue("法人");
            rowtitle.createCell(colTitle++).setCellValue("注册资金");






            for (Customer c : customers) {
                //分配每一行
                Row row = sheet.createRow(rowNum++);
                //分配每一列
                int colNum = 0;

                //为单元格赋值
                row.createCell(colNum++).setCellValue(c.getCusId());
                row.createCell(colNum++).setCellValue(c.getCusName());
                Cell cell = row.createCell(colNum++);
                cell.setCellValue(c.getCusAddr());
                row.createCell(colNum++).setCellValue(c.getCusLevel());
                row.createCell(colNum++).setCellValue(c.getCusSatisfy());
                row.createCell(colNum++).setCellValue(c.getCusCredit());
                Cell cell1 = row.createCell(colNum++);
                cell1.setCellValue(c.getCusAddr());
                row.createCell(colNum++).setCellValue(c.getCusManagerName());
                row.createCell(colNum++).setCellValue(c.getCusZip());
                row.createCell(colNum++).setCellValue(c.getCusZip());
                row.createCell(colNum++).setCellValue(c.getCusZip());
                row.createCell(colNum++).setCellValue(c.getCusCredit());
                Cell cell2 = row.createCell(colNum++);
                cell2.setCellValue(c.getCusCreatTime());
                cell2.setCellStyle(cellStyle);

            }
        }
        try {
            FileOutputStream outputStream = new FileOutputStream(path +"/"+ name + ".xlsx");
            workbook.write(outputStream);
            workbook.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
