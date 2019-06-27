class Post < ApplicationRecord
    belongs_to :bulletin
    
    has_many :crawl_lists, dependent: :destroy
    has_many :subscribes, dependent: :destroy
    
    # 게시글이 삭제되도 DB에는 원본 기록이 남아있음.
    acts_as_paranoid
    
    # 게시글 및 댓글 제목, 내용을 다 썼는지 체크
    validates :title, presence: true
    
    # 댓글
    acts_as_commentable
    
    # 조회수
    is_impressionable
    
    # 투표 Gem 관련
    acts_as_votable
    
    # cancancan 적용
    resourcify
end