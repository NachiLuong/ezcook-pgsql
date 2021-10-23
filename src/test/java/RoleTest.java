
import com.ezcook.daos.RoleDao;
import com.ezcook.daos.daoimpls.RoleDaoImpl;
import com.ezcook.entity.RoleEntity;
import org.testng.annotations.Test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class RoleTest {
    @Test
    public void checkfindAll(){
        RoleDao roleDao=new RoleDaoImpl();
        List<RoleEntity> list= roleDao.findAll();
    }
    @Test
    public  void checkUpdate(){
        RoleDao userDao=new RoleDaoImpl();
        RoleEntity entity=new RoleEntity();
        entity.setName_role("USER0001 ");
        entity.setId_role(3);
        Timestamp time= new Timestamp(System.currentTimeMillis());
        entity.setModifieddate(time);
        userDao.update(entity);
    }
    @Test
    public  void checkSave(){
        RoleDao userDao=new RoleDaoImpl();
        RoleEntity entity=new RoleEntity();
        entity.setId_role(4);
        entity.setName_role("USER02");
        Timestamp time= new Timestamp(System.currentTimeMillis());
        entity.setModifieddate(time);
        userDao.save(entity);
    }
    @Test
    public void checkfindByID(){
        RoleDao roleDao=new RoleDaoImpl();
        RoleEntity entity= roleDao.findByID(2);
    }
    @Test
    public void checkDelete(){
        List<Integer> list= new ArrayList<>();
        list.add(4);
        RoleDao roleDao=new RoleDaoImpl();
        roleDao.delete(list);
    }
}

