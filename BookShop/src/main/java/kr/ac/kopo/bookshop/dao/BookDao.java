package kr.ac.kopo.bookshop.dao;

import java.util.List;

import kr.ac.kopo.bookshop.model.Book;
import kr.ac.kopo.bookshop.pager.Pager;

public interface BookDao {

	List<Book> list(Pager pager);

	void add(Book item);

	void delet(Long code);

	void update(Book item);

	Book item(Long code);

	int total(Pager pager);
}
