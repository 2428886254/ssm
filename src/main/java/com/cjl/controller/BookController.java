package com.cjl.controller;

import com.cjl.pojo.Books;
import com.cjl.service.BookService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ChenJinLei
 * @create 2022-11-28-16:58
 */
@Controller
@RequestMapping("/book")
public class BookController {

    //controller调用service层
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    //查询所有书籍
    @RequestMapping("/allBook")
    public String Booklist(Model model){
        List<Books> list = bookService.queryAllBook();
        //往前台传数据，可以传对象，可以传List，通过el表达式 ${}可以获取到
        model.addAttribute("list",list);
        return "allBook";
    }

    //跳转到添加页面
    @RequestMapping("/toAddBook")
    public String toAddBook(){
        return "addBook";
    }

    //添加
    @RequestMapping("/addBook")
    public String addBook(Books books){
        bookService.addBook(books);
        System.out.println("addBook=>"+books);
        return "redirect:/book/allBook";//重定向到@RequestMapping("allBook")请求
    }

    //跳转到修改页面
    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(int id, Model model){
        Books books = bookService.queryBookById(id);
        model.addAttribute("books",books);
        return "updateBook";
    }

    //修改
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }

    //删除操作
    @RequestMapping("/deleteBook/{bookid}")
    public String deleteBookById(@PathVariable("bookid") int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    //查询书籍
    @RequestMapping("/queryBook")
    public String queryBookName(String queryBookName,Model model){
        Books books = bookService.queryBookName(queryBookName);
        List<Books> list = new ArrayList<Books>();
        list.add(books);
        if (books==null){
            list = bookService.queryAllBook();
            model.addAttribute("error","不存在所查询书籍");
        }
        model.addAttribute("list",list);
        return "allBook";
    }


}
