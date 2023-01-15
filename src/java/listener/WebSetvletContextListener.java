package listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
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
            ClassLoader cl = sce.getServletContext().getClassLoader();
            Enumeration<Driver> drivers = DriverManager.getDrivers();
            while (drivers.hasMoreElements()) {                
                Driver driver = drivers.nextElement();
                if (driver.getClass().getClassLoader() == cl) {
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
    }
    
}
