do

TestSynetIADSHARMDetection = {}

function TestSynetIADSHARMDetection:setUp()
	self.harmDetection = SkynetIADSHARMDetection:create()
end

function TestSynetIADSHARMDetection:testGetDetectionProbability()
	
	local mockContact = {}
	
	local mockSAM1 = {}
	function mockSAM1:getHARMDetectionChance()
		return 60
	end
	
	local mockSam2 = {}
	function mockSam2:getHARMDetectionChance()
		return 30
	end
	
	function mockContact:getAbstractRadarElementsDetected()
		return {mockSAM1, mockSam2}
	end
	
	lu.assertEquals(self.harmDetection:getDetectionProbability(mockContact), 72)
	
	function mockSAM1:getHARMDetectionChance()
		return 20
	end
	
	function mockSam2:getHARMDetectionChance()
		return 90
	end
	
	lu.assertEquals(self.harmDetection:getDetectionProbability(mockContact), 92)
	
end

end
