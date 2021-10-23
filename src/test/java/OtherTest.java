import com.ezcook.daos.*;
import com.ezcook.daos.daoimpls.*;
import com.ezcook.entity.*;
import org.testng.annotations.Test;

import java.util.List;

public class OtherTest {
    @Test
    public void checkFoodType(){
        FoodTypeDao dao=new FoodTypeDaoImpl();
        List<FoodTypeEntity> list=dao.findAll();
    }
    @Test
    public void checkFood(){
        FoodDao dao=new FoodDaoImpl();
        List<FoodEntity> list=dao.findAll();
    }
    @Test
    public void checkComment(){
        CommentDao dao=new CommentDaoImpl();
        List<CommentEntity> list=dao.findAll();
    }
    @Test
    public void checkUser(){
        UserDao dao=new UserDaoImpl();
        List<UserEntity> list=dao.findAll();
    }
    @Test
    public void checkStatistics(){
        StatisticsDao dao=new StatisticsDaoImpl();
        List<StatisticsEntity> list=dao.findAll();
    }
}
