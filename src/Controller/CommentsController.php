<?php

namespace App\Controller;

use App\Controller\AppController;

/**
 * Comments Controller
 *
 * @property \App\Model\Table\CommentsTable $Comments
 *
 * @method \App\Model\Entity\Comment[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class CommentsController extends AppController {

    public function initialize() {
        parent::initialize();
        $this->Auth->allow(['add']);
    }

    public function isAuthorized($user) {
        return true;
    }

    /**
     * Index method
     *
     * @return \Cake\Http\Response|null
     */
    public function index() {
        $this->paginate = [
            'contain' => ['Articles'],
        ];
        $comments = $this->paginate($this->Comments);

        $this->set(compact('comments'));
    }

    /**
     * View method
     *
     * @param string|null $id Comment id.
     * @return \Cake\Http\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null) {
        $comment = $this->Comments->get($id, [
            'contain' => ['Articles'],
        ]);

        $this->set('comment', $comment);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add() {
        if ($this->request->session()->read('Article.id') == false) {
            $this->Flash->error(__('Comment must be added from an article'));
            return $this->redirect(['controller' => 'articles', 'action' => 'index']);
        } else {
            $comment = $this->Comments->newEntity();
            if ($this->request->is('post')) {
                $comment = $this->Comments->patchEntity($comment, $this->request->getData());
                $comment->article_id = $this->request->session()->read('Article.id');
                $this->request->session()->delete('Article.id');
//            debug($comment); die();
                if ($this->Comments->save($comment)) {
                    $this->Flash->success(__('The comment has been saved.'));
                    $article_slug = $this->request->session()->read('Article.slug');
                    return $this->redirect(['controller' => 'articles', 'action' => 'view', $article_slug]);
                }
                $this->Flash->error(__('The comment could not be saved. Please, try again.'));
            }
            $articles = $this->Comments->Articles->find('list', ['limit' => 200]);
            $this->set(compact('comment', 'articles'));
        }
    }

    /**
     * Edit method
     *
     * @param string|null $id Comment id.
     * @return \Cake\Http\Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null) {
        $comment = $this->Comments->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $comment = $this->Comments->patchEntity($comment, $this->request->getData());
            if ($this->Comments->save($comment)) {
                $this->Flash->success(__('The comment has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The comment could not be saved. Please, try again.'));
        }
        $articles = $this->Comments->Articles->find('list', ['limit' => 200]);
        $this->set(compact('comment', 'articles'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Comment id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null) {
        $this->request->allowMethod(['post', 'delete']);
        $comment = $this->Comments->get($id);
        if ($this->Comments->delete($comment)) {
            $this->Flash->success(__('The comment has been deleted.'));
        } else {
            $this->Flash->error(__('The comment could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

}
