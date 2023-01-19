package listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.io.File;
import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;
import org.quartz.Scheduler;
import schedule.WebScheduler;

@WebListener
public class WebSetvletContextListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            Enumeration<Driver> drivers = DriverManager.getDrivers();
            while (drivers.hasMoreElements()) {                
                Driver driver = drivers.nextElement();
                if (driver instanceof com.mysql.cj.jdbc.Driver) {
                    DriverManager.deregisterDriver(driver);
                }
            }
            AbandonedConnectionCleanupThread.checkedShutdown();
            Scheduler scheduler = WebScheduler.getScheduler();
            if (scheduler.isStarted()) {
                scheduler.shutdown(true);
                System.out.println("Scheduler shutdown: " + scheduler.isShutdown());
            }
            System.out.println("Server stop");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Server start");
        System.setProperty("leon.mysql.username", System.getenv("MYSQL_USERNAME"));
        System.setProperty("leon.mysql.password", System.getenv("MYSQL_PASSWORD"));
        String uploadDirectory = System.getenv("UPDIR");
        if (uploadDirectory == null) {
            uploadDirectory = System.getProperty("catalina.home") + File.separator + "updir";
        }
        String resourceDirectory = uploadDirectory + File.separator + "resource";
        String thumbnailDirectory = uploadDirectory + File.separator + "thumbnail";
        String profileDirectory = uploadDirectory + File.separator + "profile";
        String classDirectory = uploadDirectory + File.separator + "class";
        String[] dirArray = new String[] {resourceDirectory, thumbnailDirectory, profileDirectory, classDirectory};
        for (String dir : dirArray) {
            File dirFile = new File(dir);
            if (!dirFile.isDirectory()) {
                dirFile.mkdirs();
            }
        }
        System.setProperty("leon.updir", uploadDirectory);
        System.setProperty("leon.updir.resource", resourceDirectory);
        System.setProperty("leon.updir.thumbnail", thumbnailDirectory);
        System.setProperty("leon.updir.profile", profileDirectory);
        System.setProperty("leon.updir.class", classDirectory);
    }
    
}
