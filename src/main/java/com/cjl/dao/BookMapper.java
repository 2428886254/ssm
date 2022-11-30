package com.cjl.dao;

import com.cjl.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ChenJinLei
 * @create 2022-11-28-0:21
 */
public interface BookMapper {

    //添加书籍
    int addBook(Books books);
    //删除书籍
    int deleteBookById(@Param("bookID") int id);
    //修改书籍
    int updateBook(Books books);
    //查询全部书籍
    List<Books> queryAllBook();
    //根据id查询书籍
    Books queryBookById(@Param("bookID") int id);
    //根据书名查询书籍
    Books queryBookName(@Param("bookName") String bookName);
}
