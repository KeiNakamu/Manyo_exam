FactoryBot.define do

    factory :task do
      title { 'Factoryで作ったデフォルトのタイトル1' }
      content { 'Factoryで作ったデフォルトのコンテント1' }
      deadline{Time.now}
      status {'未着手'}
    end

    factory :second_task, class: Task do
      title { 'Factoryで作ったデフォルトのタイトル2' }
      content { 'Factoryで作ったデフォルトのコンテント2' }
      deadline{Time.now + 1.days}
      status {'着手中'}
    end

    factory :third_task, class: Task do
      title { 'Factoryで作ったデフォルトのタイトル3' }
      content { 'Factoryで作ったデフォルトのコンテント3' }
      deadline{Time.now + 3.days}
      status {'完了'}
    end
end