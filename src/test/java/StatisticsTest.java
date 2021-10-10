
import com.ezcook.daoimpls.StatisticsDaoImpl;
import com.ezcook.daos.StatisticsDao;
import com.ezcook.entity.StatisticsEntity;
import org.testng.annotations.Test;

import java.util.List;

public class StatisticsTest {
    @Test
    public void checkfindAll(){
        StatisticsDao statisticsao=new StatisticsDaoImpl();
        List<StatisticsEntity> list= statisticsao.findAll();
    }
}
