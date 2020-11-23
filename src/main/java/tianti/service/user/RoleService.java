package tianti.service.user;

import tianti.domain.user.Role;

public interface RoleService {

    //根据id来查询角色
    public Role findById(Integer id);
}
