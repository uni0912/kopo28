package sel;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class NaverFinance {

	public static WebDriver driver;
    public static String base_url = "https://finance.naver.com/";
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:\\Users\\kopo28\\Downloads\\chromedriver_win32\\chromedriver.exe";
   
    public static void main(String[] args) throws InterruptedException {     
	           
	        //System Property SetUp
	        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	        
	        //Driver SetUp
	        driver = new ChromeDriver();
	        crawl();
	    }
	    
	    public static void crawl() {
	    	ArrayList<String> header = new ArrayList<>();
	    	ArrayList<String> rank = new ArrayList<>();
	    	ArrayList<String> title = new ArrayList<>();
	    	ArrayList<String> number = new ArrayList<>();
	    	ArrayList<String> urlList = new ArrayList<>();
	    	
	    	
	    	try {
	    		driver.get(base_url);
	            Thread.sleep(2000);
	            driver.findElement(By.xpath("/html/body/div[3]/div[3]/div[2]/div[2]/div[2]/a/em")).click();
	            Thread.sleep(2000);	  
	            
	            WebElement tmp = driver.findElement(By.className("type_5"));
	            List<WebElement> el1 = tmp.findElements(By.tagName("th"));
	            
	            for (int i = 0; i< el1.size(); i++) {
	            	header.add(el1.get(i).getText());
	            }
	                        
	            List<WebElement> el2 = tmp.findElements(By.className("no"));
	           
	            for (int i = 0; i< el2.size(); i++) {
	            	rank.add(el2.get(i).getText());
	            }
	            
	            List<WebElement> el3 = tmp.findElements(By.className("tltle"));
	            
	            for (int i = 0; i< el3.size(); i++) {
	            	title.add(el3.get(i).getText());
	            	urlList.add(el3.get(i).getAttribute("href"));
	            }
	            for (int i = 0; i < urlList.size(); i++) {
	            	System.out.println(urlList.get(i));
	            }
	           
	            List<WebElement> el4 = tmp.findElements(By.className("number"));
	           
	            for (int i = 0; i< el4.size(); i++) {
	            	number.add(el4.get(i).getText().replaceAll(",", ""));
	            }
	           

	            
			} catch (Exception e) {
				e.printStackTrace(); 
				
			} finally {
				driver.close();
			}
	    	
	    	//누적csv파일은 헤더를 없는 상태로 계속해서 이어쓰기
	    	try {
	    		PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter("C:\\Users\\kopo28\\Desktop\\SelTest\\NaverFinanceTop30.csv", true)));
//	    		for (int i = 0; i < header.size(); i++) {
//	    			if (i == header.size()-1) {
//	    				pw.println(header.get(i));
//	    			} else {
//	    				pw.print(header.get(i) + ",");
//	    			}
//	    			
//	    		}
	    		for (int i = 0; i < rank.size(); i++) {
	    			pw.print(rank.get(i) + ",");
	    			pw.print(title.get(i) + ",");    			   				
    				pw.print(number.get(i*10+0) + ",");
    				pw.print(number.get(i*10+1) + ",");
    				pw.print(number.get(i*10+2) + ",");
    				pw.print(number.get(i*10+3) + ",");
    				pw.print(number.get(i*10+4) + ",");
    				pw.print(number.get(i*10+5) + ",");
    				pw.print(number.get(i*10+6) + ",");
    				pw.print(number.get(i*10+7) + ",");
    				pw.print(number.get(i*10+8) + ",");
    				pw.print(number.get(i*10+9) + ",");
    				pw.println(urlList.get(i));
    	
	    		}
				
				pw.close();
				
							
			} catch (IOException e) {
				e.printStackTrace();
			}
	    //현재 인기검색어만 보여주는 파일은 헤더 필요
    	try {
    		PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter("C:\\Users\\kopo28\\Desktop\\SelTest\\NaverFinanceTop30_now.csv")));
    		for (int i = 0; i < header.size(); i++) {
    			if (i == header.size()-1) {
    				pw.println(header.get(i));
    			} else {
    				pw.print(header.get(i) + ",");
    			}
    			
    		}
    		for (int i = 0; i < rank.size(); i++) {
    			pw.print(rank.get(i) + ",");
    			pw.print(title.get(i) + ",");    			   				
				pw.print(number.get(i*10+0) + ",");
				pw.print(number.get(i*10+1) + ",");
				pw.print(number.get(i*10+2) + ",");
				pw.print(number.get(i*10+3) + ",");
				pw.print(number.get(i*10+4) + ",");
				pw.print(number.get(i*10+5) + ",");
				pw.print(number.get(i*10+6) + ",");
				pw.print(number.get(i*10+7) + ",");
				pw.print(number.get(i*10+8) + ",");
				pw.print(number.get(i*10+9) + ",");
				pw.println(urlList.get(i));
	
    		}
			
			pw.close();
			
						
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	    
	}
