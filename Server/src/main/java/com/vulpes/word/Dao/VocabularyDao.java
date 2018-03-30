package com.vulpes.word.Dao;

import com.google.appengine.api.datastore.*;
import com.vulpes.word.Model.WordModel;

import java.util.ArrayList;
import java.util.List;

public class VocabularyDao {
    public static final List<WordModel> getWordList() {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        Query q = new Query("Vocabulary");
        PreparedQuery pq = datastore.prepare(q);
        List<Entity> list = pq.asList(FetchOptions.Builder.withDefaults());


        List<WordModel> wordList = new ArrayList<>();
        for (Entity entity : list) {
            WordModel model = new WordModel();
            model.setEn((String) entity.getProperty("en"));
            model.setCn((String) entity.getProperty("cn"));
            wordList.add(model);
        }

        return wordList;
    }
}
