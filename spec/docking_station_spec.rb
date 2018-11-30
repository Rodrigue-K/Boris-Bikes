require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'release a working bike' do
    new_bike = Bike.new
    subject.dock(new_bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'dock a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it { is_expected.to respond_to(:bikes) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe '#release_bike' do
    it 'release a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raise an error when no bike' do
      expect {subject.release_bike}.to raise_error('No bikes available')
    end
  end

  describe '#dock' do
    it 'raise an error when the dock is full' do
      20.times {subject.dock Bike.new}
      expect {subject.dock(Bike.new)}.to raise_error('Docking station full')
    end
  end

end
