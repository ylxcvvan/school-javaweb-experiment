package cdu.wycy.dao;
import java.util.List;
// dao层的父接口
public interface SimpleDao<T> {
    T findById(int id);
    List<T> query(T condition); // 模糊查询
    List<T> query(T condition, int start, int num); // 模糊分页查询
    int insert(T t);
    int update(T t);
    int delete(int id);
    int count(T condition);
}