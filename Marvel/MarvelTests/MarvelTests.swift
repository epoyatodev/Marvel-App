//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine

final class MarvelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    
    // MARK: Test de UI
    
    func testLoadView() throws {
        let view = LoaderView().environmentObject(HeroViewModel())
        
        XCTAssertNotNil(view)
        
         // Load Image
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        // Load Text
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
    }
    
    
    func testErrorView() throws {
        let view = ErrorView(error: "Testing")
            .environmentObject(HeroViewModel())
        
        XCTAssertNotNil(view)
        
        // Imagen de error
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        // Texto de error
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Testing")
        
        // Boton
        
        let boton = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(boton)
        try boton.button().tap()
        
        
    }
    
    func testHerosViewRow() throws {
        let view = HerosViewRow(hero: Hero(id: 1, name: "Hulk", description: "Prueba", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")])).environmentObject(HeroViewModel())
        
        XCTAssertNotNil(view)
        
         // Image
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        // Placeholder Image
        let placeholder = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(placeholder)
        
        // Load Text
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
    }
    
    func testHeroDetailView() throws {
        let vm = SeriesHeroViewModel(id: 1011136)
        let view = HeroDetailView(viewModel: vm, hero: Hero(id: 1011136, name: "Goku", description: "Prueba", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")]))
            .environmentObject(HeroViewModel())
        
        XCTAssertNotNil(view)
        
        let list = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(list)
 
    }
    
    
    func testSeriesHeroRowView() throws {
        let view = SeriesHeroRow(serie: Series(id: 1, title: "Serie Test", description: "Descripcion Test", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244"))).environmentObject(HeroViewModel())
        
        XCTAssertNotNil(view)
        
        // Title
       let title = try view.inspect().find(viewWithId: 0)
       XCTAssertNotNil(title)
        
         // Image
        let image = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
        
        // Placeholder Image
        let placeholder = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(placeholder)
        
        // Description
        let description = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(description)

        
    }
    
    
    // MARK: Test de Modelos
    
    func testModels() throws {
        let hero = Hero(id: 1, name: "Hulk", description: "Test", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")])
        
        XCTAssertNotNil(hero)
        XCTAssertEqual(hero.name, "Hulk")
        XCTAssertEqual(hero.description, "Test")
        XCTAssertEqual(hero.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(hero.thumbnail.thumbnailExtension, "jpg")
        
        
        let series = Series(id: 1, title: "Serie Test", description: "Description Test", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244"))
        
        XCTAssertNotNil(series)
        XCTAssertEqual(series.title, "Serie Test")
        XCTAssertEqual(series.description, "Description Test")
        XCTAssertEqual(series.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244")
        XCTAssertEqual(series.thumbnail.thumbnailExtension, "jpg")


        
    }
    
    // MARK: Test de Combine
    
    func testHeroViewModel() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Carga de heroes")
        
        let vm = HeroViewModel(testing: false)
        XCTAssertNotNil(vm)
        
        // Observador de Bootcamps
        vm.heros.publisher
            .sink { completion in
                switch completion{
                case.finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case.failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &suscriptor)
        
        vm.getHeros(filter: "")
        
        self.waitForExpectations(timeout: 10)
        
        
    }
    
    func testSeriesHeroViewModel() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Carga de series")
        
        let vm = SeriesHeroViewModel(id: 1011136)
        XCTAssertNotNil(vm)
        
        // Observador de Bootcamps
        vm.series.publisher
            .sink { completion in
                switch completion{
                case.finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case.failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &suscriptor)
        
        vm.getHerosSeries(id: 1011136)
        
        self.waitForExpectations(timeout: 10)
        
        
    }

    
    
}
