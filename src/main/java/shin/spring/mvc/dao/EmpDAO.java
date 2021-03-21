package shin.spring.mvc.dao;

import shin.spring.mvc.vo.EmpVO;

import java.util.List;
import java.util.Map;

public interface EmpDAO {
    int insertEvo(EmpVO evo);

    EmpVO readLastEmp();

    List<EmpVO> selectAllEmp(int snum);

    int selectAllEmpCnt();

    List<EmpVO> selectAllFindEmp(Map<String, Object> map);

    int selectAllFindEmpCnt(Map<String, String> map);

    EmpVO selectOneData(String eno);

    int platUpdateData(EmpVO evo);

    int delData(int eno);

    int insertModiEvo(EmpVO evo);
}
