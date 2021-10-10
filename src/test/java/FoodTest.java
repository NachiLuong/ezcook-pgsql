
import com.ezcook.daoimpls.FoodDaoImpl;
import com.ezcook.daos.FoodDao;
import com.ezcook.entity.FoodEntity;
import org.testng.annotations.Test;

import java.util.List;

public class FoodTest {
    @Test
    public void checkfindAll(){
        FoodDao foodDao=new FoodDaoImpl();
        List<FoodEntity> list= foodDao.findAll();
    }
}
