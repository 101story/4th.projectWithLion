
class AboutObjects 
    ## Object ##
    def test_everything_is_an_object # 모든것은 객체
        assert_equal true, 1.is_a?(Object)
        assert_equal true, 1.5.is_a?(Object)
        assert_equal true, "string".is_a?(Object)
        assert_equal true, nil.is_a?(Object)
        assert_equal true, Object.is_a?(Object)
    end
    
    def test_objects_can_be_converted_to_strings # 객체는 string으로 바꿀수 있습니다.
        assert_equal "123", 123.to_s
        assert_equal "", nil.to_s   # nil 을 문자로 바꾸면 
    end
    
    ## Nil ##
    #nil조차 객체
    def test_nil_is_an_object 
        assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
    end

    #예외도 객체 
    def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
        # 존재하지 않는 메소드를 호출하면 어떻게 될까요?
        # 다음 begin rescue end로 이루어진 코드는 예외를 잡는 코드입니다.
        begin
            nil.some_method_nil_doesnt_know_about
        rescue Exception => ex
            # 어떤 예외가 나왔나요?
            assert_equal NoMethodError, ex.class
            
            # 예외에 어떤 메세지가 출력되었나요?
            # (HINT: __ 빈칸에 출력된 메세지를 넣어주세요)
            assert_match(/some_method_nil_doesnt_know_about/, ex.message)
        end
    end

    # 그밖에 nil 특징
    def test_nil_has_a_few_methods_defined_on_it
        assert_equal true, nil.nil?
        assert_equal "", nil.to_s
        assert_equal "nil", nil.inspect
    end
    
    
    ## Array ##
    # 없는 값을 꺼내면 
    def test_parallel_assignments_with_too_few_variables
        first_name, last_name = ["Cher"]
        assert_equal "Cher", first_name
        assert_equal nil, last_name
    end
    
    #Array에 데이터 넣기
    def test_array_literals 
        array = Array.new
        assert_equal [], array
    
        array[0] = 1
        assert_equal [1], array
    
        array[1] = 2
        assert_equal [1, 2], array
    
        array << 333
        assert_equal [1, 2, 333], array
    end
    
    #Array를 쪼개기
    def test_slicing_arrays 
        array = [:peanut, :butter, :and, :jelly]
    
        assert_equal [:peanut], array[0,1]
        assert_equal [:peanut, :butter], array[0,2]
        assert_equal [:and, :jelly], array[2,2]
        assert_equal [:and, :jelly], array[2,20]
        assert_equal [], array[4,0]
        assert_equal [], array[4,100]
        assert_equal nil, array[5,0]
    end
    
    #Array와 Range를 비교
    def test_arrays_and_ranges 
        assert_equal Range, (1..5).class
        assert_not_equal [1,2,3,4,5], (1..5)
        assert_equal [1,2,3,4,5], (1..5).to_a
        assert_equal [1,2,3,4], (1...5).to_a
    end
    
    #Range로 자르기
    def test_slicing_with_ranges 
        array = [:peanut, :butter, :and, :jelly]
        
        assert_equal [:peanut, :butter, :and], array[0..2]
        assert_equal [:peanut, :butter], array[0...2]
        assert_equal [:and, :jelly], array[2..-1]
    end
    
    # Array의 메소드 push와 pop (Stack)
    def test_pushing_and_popping_arrays 
        array = [1,2]
        array.push(:last)
        
        assert_equal [1,2, :last], array
        
        popped_value = array.pop
        assert_equal :last, popped_value
        assert_equal [1,2], array
    end
    
    # Array에서 shift (Queue)
    def test_shifting_arrays 
        array = [1,2]
        array.unshift(:first)
        
        assert_equal [:first, 1, 2] , array
        
        shifted_value = array.shift
        assert_equal :first, shifted_value
        assert_equal [1,2], array
    end    
    
    ## Hash ##
    #hash를 생성
    def test_creating_hashes 
        empty_hash = Hash.new
        assert_equal Hash, empty_hash.class
        assert_equal({}, empty_hash)
        assert_equal 0, empty_hash.size
    end    
    
    #fetch를 이용해서 hash에 접근
    def test_accessing_hashes_with_fetch 
        hash = { :one => "uno" }
        assert_equal "uno", hash.fetch(:one)
        assert_raise(KeyError) do
            hash.fetch(:doesnt_exist)
        end
    end
    
end 

AboutObjects.test_accessing_hashes_with_fetch
AboutObjects.test_creating_hashes
AboutObjects.test_arrays_and_ranges
AboutObjects.test_shifting_arrays
AboutObjects.test_pushing_and_popping_arrays
AboutObjects.test_everything_is_an_object
