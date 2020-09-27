<?php

// src/Model/Table/ArticlesTable.php

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Utility\Text;
// add this use statement right below the namespace declaration to import
// the Validator class
use Cake\Validation\Validator;

class ArticlesTable extends Table {

    public function initialize(array $config) {
        parent::initialize($config);
        $this->addBehavior('Translate', ['fields' => ['title', 'body']]);
        $this->addBehavior('Timestamp');
        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'joinType' => 'INNER'
        ]);
        $this->hasMany('Comments', [
            'foreignKey' => 'article_id',
        ]);
        $this->belongsToMany('Tags', [
            'foreignKey' => 'article_id',
            'targetForeignKey' => 'tag_id',
            'joinTable' => 'articles_tags',
        ]);
    }

// Add the following method.

    public function beforeSave($event, $entity, $options) {
        if ($entity->isNew() && !$entity->slug) {
            $sluggedTitle = Text::slug($entity->title);
            // trim slug to maximum length defined in schema
            $entity->slug = substr($sluggedTitle, 0, 191);
        }
    }

// Add the following method.
    public function validationDefault(Validator $validator) {
        $validator
                ->allowEmptyString('title', false)
                ->minLength('title', 10)
                ->maxLength('title', 255)
                ->allowEmptyString('body', false)
                ->minLength('body', 10);

        return $validator;
    }

}
