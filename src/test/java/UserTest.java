
import com.ezcook.daoimpls.UserDaoImpl;
import com.ezcook.daos.UserDao;
import com.ezcook.entity.UserEntity;
import org.testng.annotations.Test;

import java.util.List;

public class UserTest {
    @Test
    public void checkfindAll(){
        UserDao userDao=new UserDaoImpl();
        List<UserEntity> list= userDao.findAll();
    }
}
