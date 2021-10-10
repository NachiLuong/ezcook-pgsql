import com.ezcook.daoimpls.RoleDaoImpl;
import com.ezcook.daos.RoleDao;
import com.ezcook.entity.RoleEntity;
import org.testng.annotations.Test;

import java.sql.Timestamp;
import java.util.List;

public class RoleTest {
    @Test
    public void checkfindAll(){
        RoleDao roleDao=new RoleDaoImpl();
        List<RoleEntity> list= roleDao.findAll();
    }
    @Test
    public  void checkSave(){
        RoleDao userDao=new RoleDaoImpl();
        RoleEntity entity=new RoleEntity();
        entity.setName_role("USER02");
        entity.setId_role(1);
        Timestamp time= new Timestamp(System.currentTimeMillis());
        entity.setModifieddate(time);
        userDao.save(entity);
    }
}
