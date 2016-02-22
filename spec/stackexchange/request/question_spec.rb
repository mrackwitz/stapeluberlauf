require_relative '../../../spec/helper'

describe Stapeluberlauf::Request::Question do
  let(:site) { Stapeluberlauf.site('stackoverflow') }

  describe 'operating on one or multiple questions' do
    let(:base_request) { site.question('55574') }
    subject { base_request }

    it_behaves_like 'commentable'
    it_behaves_like 'editable'
    it_behaves_like 'favoritable'
    it_behaves_like 'flagable'
    it_behaves_like 'upvotable'
    it_behaves_like 'downvotable'

    describe :answers do
      subject { super().answers }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/answers"
      end
    end

    describe :add_answer do
      subject { super().add_answer }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/answers/add"
      end
    end

    describe :render_answer do
      subject { super().render_answer }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/answers/render"
      end
    end

    describe :close_options do
      subject { super().close_options }

      it_behaves_like 'requires auth'

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/close/options"
      end
    end

    describe :linked do
      subject { super().linked }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/linked"
      end
    end

    describe :related do
      subject { super().related }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/related"
      end
    end

    describe :timeline do
      subject { super().timeline }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/timeline"
      end
    end
  end

  describe 'collection-bound' do
    let(:base_request) { site.questions }
    subject { base_request }

    describe :render do
      subject { super().render }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/render"
      end
    end

    describe :add do
      subject { super().add }

      it_behaves_like 'requires auth'

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/add"
      end
    end

      describe :featured do
      subject { super().featured }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/featured"
      end
    end

    describe :no_answers do
      subject { super().no_answers }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/no-answers"
      end
    end

    describe :unanswered do
      subject { super().unanswered }

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/unanswered"
      end
    end

    describe :unanswered_with_my_tags do
      subject { super().unanswered_with_my_tags }

      it_behaves_like 'requires auth'

      it 'returns the endpoint' do
        expect(subject.endpoint).to eq "#{base_request.endpoint}/unanswered/my-tags"
      end
    end
  end
end
