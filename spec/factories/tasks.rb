FactoryBot.define do

    factory :task do
      title { 'Factoryで作ったデフォルトのタイトル1' }
      content { 'content_test1' }
      deadline{Time.now}
      status {'未着手'}
      priority {'高'}
    end

    factory :second_task, class: Task do
      title { 'Factoryで作ったデフォルトのタイトル2' }
      content { 'content_test2' }
      deadline{Time.now + 5.days}
      status {'着手中'}
      priority {'中'}
    end

    factory :third_task, class: Task do
      title { 'Factoryで作ったデフォルトのタイトル3' }
      content { 'content_test3' }
      deadline{Time.now + 3.days}
      status {'完了'}
      priority {'低'}
    end
end