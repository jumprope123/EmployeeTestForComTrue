package shin.spring.mvc.service;

import shin.spring.mvc.vo.EmpVO;

import java.util.List;

public interface EmpService {
    int insertEvo(EmpVO evo);

    EmpVO readlastEmp();

    List<EmpVO> readAllEmp(String cp);

    int countData();

    List<EmpVO> readAllEmp(String cp, String findtype, String findkey);

    int countData(String findtype, String findkey);

    EmpVO readOneData(String eno);

    int platModi(EmpVO evo);

    int delData(int eno);

    int insertmodiEvo(EmpVO evo);
}
