package schedule;

import org.quartz.Scheduler;
import org.quartz.impl.StdSchedulerFactory;

public class WebScheduler {
    private static volatile Scheduler scheduler;

    private WebScheduler() {
    }
    
    public static Scheduler getScheduler() {
        if (scheduler == null) {
            synchronized (Scheduler.class) {
                if (scheduler == null) {
                    try {
                        scheduler = new StdSchedulerFactory().getScheduler();
                        scheduler.start();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return scheduler;
    }
}
