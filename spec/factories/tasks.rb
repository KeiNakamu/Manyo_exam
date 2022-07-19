FactoryBot.define do

    factory :task do
      title { 'Factoryで作ったデフォルトのタイトル1' }
      content { 'content_test1' }
      deadline{Time.now}
      status {'未着手'}
      created_at{Time.now}
      priority {'高'}
      association :user
    end

    factory :second_task, class: Task do
      title { 'Factoryで作ったデフォルトのタイトル2' }
      content { 'content_test2' }
      deadline{Time.now + 5.days}
      status {'着手中'}
      created_at{Time.now - 5.days}
      priority {'低'}
      association :user
    end

    factory :third_task, class: Task do
      title { 'Factoryで作ったデフォルトのタイトル3' }
      content { 'content_test3' }
      deadline{Time.now + 3.days}
      status {'完了'}
      created_at{Time.now - 3.days}
      priority {'中'}
      association :user
    end
end