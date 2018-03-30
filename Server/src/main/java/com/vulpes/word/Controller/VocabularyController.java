package com.vulpes.word.Controller;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.vulpes.word.Dao.VocabularyDao;
import com.vulpes.word.Model.WordModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by benny on 2016/1/16.
 */
@Controller
public class VocabularyController {
    @RequestMapping("/vocabulary")
    @ResponseBody
    public List<WordModel> getVocabulary() {
        return VocabularyDao.getWordList();
    }


    @RequestMapping("/")
    @ResponseBody
    public String mock() {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        Entity table1 = new Entity("Vocabulary");
        table1.setProperty("en", "one");
        table1.setProperty("cn", "一");
        datastore.put(table1);

        Entity table2 = new Entity("Vocabulary");
        table2.setProperty("en", "two");
        table2.setProperty("cn", "二");
        datastore.put(table2);

        Entity table3 = new Entity("Vocabulary");
        table3.setProperty("en", "three");
        table3.setProperty("cn", "三");
        datastore.put(table3);

        Entity table4 = new Entity("Vocabulary");
        table4.setProperty("en", "four");
        table4.setProperty("cn", "四");
        datastore.put(table4);

        Entity table5 = new Entity("Vocabulary");
        table5.setProperty("en", "five");
        table5.setProperty("cn", "五");
        datastore.put(table5);

        Entity table6 = new Entity("Vocabulary");
        table6.setProperty("en", "six");
        table6.setProperty("cn", "六");
        datastore.put(table6);

        Entity table7 = new Entity("Vocabulary");
        table7.setProperty("en", "seven");
        table7.setProperty("cn", "七");
        datastore.put(table7);

        Entity table8 = new Entity("Vocabulary");
        table8.setProperty("en", "eight");
        table8.setProperty("cn", "八");
        datastore.put(table8);

        return "success";
    }
}