package kr.ac.kopo.bookshop.service;

import java.util.List;

import kr.ac.kopo.bookshop.model.Book;
import kr.ac.kopo.bookshop.model.Member;
import kr.ac.kopo.bookshop.pager.Pager;


public interface BookService {
	List<Book> list(Pager pager);

	void add(Book item);

	void delete(Long code);

	void update(Book item);

	Book item(Long code);

	void dummy();

	void init();
}
