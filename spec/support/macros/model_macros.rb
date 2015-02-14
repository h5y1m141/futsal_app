module ModelMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def it_counts(association_name, counter_name: self.parent.description[1..-1], from: 0, to: 1, label: "#{association_name}をカウントする")
      it label do
        child
        expect { event.call }.to change { parent.reload; parent.send(counter_name) }.from(from).to to
      end
    end

    def when_association_increased(association_name, label: "#{association_name}が増えた時", &block)
      context label do
        let(:parent) { create(described_class.to_s.underscore) }
        let(:child) { build(association_name.to_s.singularize) }
        let(:event) { -> { parent.send(association_name) << child } }

        class_eval(&block) if block

        it_counts(association_name, label: 'インクリメントされる')
      end
    end

    def when_association_decreased(association_name, label: "#{association_name}が減った時", &block)
      context label do
        let(:parent) { create(described_class.to_s.underscore) }
        let(:child) { create(association_name.to_s.singularize, described_class.to_s.underscore => parent) }
        let(:event) { -> { child.destroy } }

        class_eval(&block) if block

        it_counts(association_name, from: 1, to: 0, label: 'デクリメントされる')
      end
    end
  end
end

RSpec.configure do |config|
  config.include ModelMacros, type: :model
end
