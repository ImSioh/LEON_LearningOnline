package schedule;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.quartz.DateBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import static org.quartz.TriggerBuilder.newTrigger;
import org.quartz.TriggerKey;

public class ForgetSchedule implements Job {

    public static final Map<TriggerKey, String> validTriggers = Collections.synchronizedMap(new HashMap<TriggerKey, String>());
    private static JobDetail jobdetail;

    public static TriggerKey subscribeJob(Date datetime, String email) {
        try {
            Scheduler scheduler = WebScheduler.getScheduler();
            if (jobdetail == null) {
                synchronized (JobDetail.class) {
                    if (jobdetail == null) {
                        jobdetail = JobBuilder.newJob(ForgetSchedule.class).storeDurably().build();
                        scheduler.addJob(jobdetail, true);
                    }
                }
            }
            Trigger trigger = newTrigger()
                    .startAt(datetime)
                    .forJob(jobdetail)
                    .build();
            validTriggers.put(trigger.getKey(), email);
            scheduler.scheduleJob(trigger);
            System.out.println("Forgot password token in total: " + validTriggers.size());
            return trigger.getKey();
        } catch (SchedulerException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException {
        TriggerKey triggerKey = jec.getTrigger().getKey();
        String email = validTriggers.get(triggerKey);
        validTriggers.remove(triggerKey);
        System.out.println("Forgot password token for " + email + " expire now, " + validTriggers.size() + " jobs left");
    }

}
