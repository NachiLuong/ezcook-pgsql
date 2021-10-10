
import com.ezcook.daoimpls.FoodTypeDaoImpl;
import com.ezcook.daos.FoodTypeDao;
import com.ezcook.entity.FoodTypeEntity;
import org.testng.annotations.Test;

import java.util.List;

public class FoodTypeTest {
    @Test
    public void checkfindAll(){
        FoodTypeDao foodTypeDao=new FoodTypeDaoImpl();
        List<FoodTypeEntity> list= foodTypeDao.findAll();
    }
}
